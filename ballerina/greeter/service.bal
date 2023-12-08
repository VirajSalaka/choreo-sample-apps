import ballerina/http;

http:Client albumClient = check new ("https://d756-203-94-95-4.ngrok.io");
service / on new http:Listener(9090) {

    resource function 'default [string... path](http:Request req) returns json|error {
        json payload = check albumClient->forward("/greeting", req);
        return payload;
    }
}
