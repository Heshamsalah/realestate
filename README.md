# README

### RAILS VERSION = 5.1.4
### RUBY VERSION = 2.4.0

### Getting the project up and running

1. `bundle install`
2. `rake db:migrate`
3. `rake db:seed`
4. `rails s`

### Run tests:
* `rspec`

### API Docs:
1. To retrieve paginated data
`get /api/v1/realestatetransactions?page=$page_number&limit=$max_per_page`
2. To get a record
`get /api/v1/realestatetransactions/:id`
3. To delete a record
`delete /api/v1/realestatetransactions/:id`
4. To update a record
`patch /api/v1/realestatetransactions?id=$id&transaction[$some_field]=$some_value`
list of available fields to update:
- `street`
- `city`
- `price`
- `beds`
- `baths`
- `sq_ft`
- `sale_date`
- `category`
- `state`
- `zip`
- `longtude`
- `latitude`
5. To create a new record:
`post /api/v1/realestatetransactions?transaction[$some_field]=$some_value`
You can supply the same field as in the previous point.
6. To search for any record:
`get /api/v1/realestatetransactions/search?page=$page_number&limit=$max_per_page&search[$some_field]=$some_value`
- `$some_field`: `category`, `price_range` and `sq_ft_range`.
- `price_range` should be `-` separated value, ex: `search[price_range]=100-100000`.
- `sq_ft_range` should also be `-` separated value.
