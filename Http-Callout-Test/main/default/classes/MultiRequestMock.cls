/**
 * Test class to support when multiple HTTP Callouts is made in single transaction
 */
@isTest
public class MultiRequestMock implements HttpCalloutMock {

    public class MultiRequestMockException extends Exception {}

    Map<String, HttpCalloutMock> requests;
    
    public MultiRequestMock(){
        this.requests = new Map<String, HttpCalloutMock>();
    }

    public MultiRequestMock(Map<String, HttpCalloutMock> requests) {
        this.requests = requests;
    }
 
    public HTTPResponse respond(HTTPRequest req) {
        HttpCalloutMock mock = requests.get(req.getEndpoint()+req.getMethod());
        if (mock != null) {
            return mock.respond(req);
        } else {
            throw new MultiRequestMockException('HTTP callout not supported for test methods');
        }
    }
    
    public void addRequestMock(String url, String httpMethod, HttpCalloutMock mock) {
        requests.put(url+httpMethod, mock);
    }
}