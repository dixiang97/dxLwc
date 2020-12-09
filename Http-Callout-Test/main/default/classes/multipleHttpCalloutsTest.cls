@IsTest
public with sharing class multipleHttpCalloutsTest {
    @IsTest
    private static void TestGenerateROPA(String controllerType, Integer reportNum){
        //Callout 1 
        Map<String, String> updateFilterHeaders = new Map<String, String>();
        updateFilterHeaders.put('Content-Type', 'application/json');
        SingleRequestMock updateFilterMock = new SingleRequestMock(200,'Complete','',updateFilterHeaders);

        //Callout 2
        Map<String, String> excelReportHeaders = new Map<String, String>();
        excelReportHeaders.put('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        Blob responseBody = Blob.valueof('Fake Response Body String');
        SingleRequestMock excelReportMock = new SingleRequestMock(200, 'Complete', responseBody, excelReportHeaders);

        MultiRequestMock multiCalloutMock = new MultiRequestMock();

        String endpoint = System.URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v50.0/analytics/reports/' + report.Id;
        multiCalloutMock.addRequestMock(endpoint, 'PATCH', updateFilterMock);
        multiCalloutMock.addRequestMock(endpoint, 'GET', excelReportMock);
        
        Test.setMock(HttpCalloutMock.class, multiCalloutMock);
        Test.startTest();
        //Run apex method that execute multiple http callouts
        Test.stopTest();
    }
}
