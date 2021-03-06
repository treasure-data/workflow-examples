# Workflow: export_result
This example shows how use result_export API in Treasure Data workflow.
You can export result to Your MySQL without running the same query.

## Scenario

## Note

Using `td_result_export` operator is much easier and simpler for calling API by yourself.
If you want to know how to use `td_result_export`, please check the [Doc](https://docs.treasuredata.com/display/public/PD/Reference+for+Treasure+Data+Operators#ReferenceforTreasureDataOperators-td_result_export%3E:)

The sample is [here](https://github.com/treasure-data/treasure-boxes/blob/master/scenarios/result_export/export_result_prallel.dig)

1. Run Query
2. Export Result to MySQL

## How to Run for Server/Client Mode
First, please upload the workflow.
```
# Upload
$ td wf push export_result_mysql
```

Second, please set your td account credentials by ```td wf secrets``` command.
```
# Set Secrets
$ td wf secret --project export_result_mysql --set td.apikey
$ td wf secret --project export_result_mysql --set http.authorization
```

Note: http.authorization is used as header in your API request.
You must http.authorization like this : ```TD1 <Your APIKey>```

For detail, please refer to the below page.
https://docs.treasuredata.com/display/public/PD/Product+Documentation+Home


Third, please set your other services' credentials by ```td wf secrets``` command.
```
# Set Secrets again
$ td wf secret --project export_result_mysql --set mysqlUser // MySQL Username
$ td wf secret --project export_result_mysql --set mysqlPass // User's password
$ td wf secret --project export_result_mysql --set mysqlHost // MySQL Host Name
$ td wf secret --project export_result_mysql --set mysqlPort // This is option
$ td wf secret --project export_result_mysql --set mysqlDatabase // MySQL Database
$ td wf secret --project export_result_mysql --set mysqlTable // MySQL Table
```

For detail, please refer to below page.
https://docs.treasuredata.com/display/public/PD/Setting+Workflow+Secrets+from+the+Command+Line

Finally, you can trigger the session manually.

```
# Run
$ td wf start export_result_mysql export_result_mysql --session now
```

## Next Step
If you have any questions, please contact to support@treasuredata.com.
