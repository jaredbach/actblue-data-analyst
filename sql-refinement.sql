-- This query breaks down how much money ACTBLUE raised from in-state vs out-of-state donors in Q1 2020. 
-- It grabs their latest filings for that quarter, pulls in donation data, matches each donor’s state to the committee’s home state, then sums it all up to show in-state vs out-of-state totals and the in-state share.

-- CTE retrieving the most recent filing ID for committee 'C00401224' for different coverage start and end dates in Q1 2020
with most_recent_filing_id as (
    select
        filer_committee_id_number
        , coverage_from_date
        , coverage_through_date
        , max(fec_report_id) as report_id 
    from f3x_fecfile 
    where
        filer_committee_id_number = 'C00401224'
        and coverage_from_date between '2020-01-01' and '2020-03-31'
    group by 1, 2, 3
),

-- CTE that returns more information on the contributors and their donations
contributors_quarter_one_2020 as (
    select
        sa.fec_report_id
        , sa.date_report_received
        , sa.form_type
        , sa.filer_committee_id_number
        , sa.transaction_id
        , sa.entity_type
        , sa.contributor_last_name
        , sa.contributor_first_name
        , sa.contributor_street_1
        , sa.contributor_city
        , sa.contributor_state
        , sa.contributor_zip_code
        , sa.contribution_date
        , sa.contribution_amount::text
        , sa.contribution_aggregate::text
        , sa.contribution_purpose_descrip
        , sa.contributor_employer
        , sa.contributor_occupation
        , sa.memo_text_description
    from sa_fecfile as sa
    inner join most_recent_filing_id as lr 
        on sa.fec_report_id = lr.report_id
    where upper(sa.form_type) = 'SA11AI'
    order by random() -- This might slow down the query
    limit 1600000 -- Limitting this number may not return the entire dataset
),

-- Returns all FEC committee data from the 2020 cycle
FEC_Committee_Data_2020 as (
    select
        *
    from fec_committees
    where bg_cycle = 2020
),

-- CTE returning the sum of all contributions by state and committee ID number
contributions_by_state_and_committee as (
    select
        filer_committee_id_number
        , contributor_state
        , sum(contribution_aggregate) as total
    from DS_technical_112221
    group by 1, 2
)

-- Final query combining contributions with committee data
-- In this CTE, we unnested the select statements to make the code easier to read
-- This will return the percentage of donations that were made in the state of Massachussetts, where ActBlue is based, as well as the total donations made in-state and out-of-state
select
    c.cmte_nm
    , sum(case when c.cmte_st = b.contributor_state then total else 0 end) as in_state
    , sum(case when c.cmte_st != b.contributor_state then total else 0 end) as out_of_state
    , (
        sum(case when c.cmte_st = b.contributor_state then total else 0 end)::numeric
        / nullif(sum(total), 0)::numeric
    ) as in_state_pct
from contributions_by_state_and_committee as b
inner join FEC_Committee_Data_2020 as c
    on b.filer_committee_id_number = c.cmte_id
where c.cmte_nm = 'ACTBLUE'
group by c.cmte_nm;
