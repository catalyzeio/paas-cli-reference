---
title: Password Reset
layout: baas_guides
---

# Password Reset
Catalyze offers password reset by username. When a user forgets their password, they should be prompted to input their username and then a request should be made to initiate the password reset process sending that username. Once received, their uesrname is queried and an email containing a link to reset their password is sent to the email we have on file for that username. That link will open a form that asks them to enter their new password and will perform the reset once they click submit.

### Initiate Password Reset

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/{appId}/reset/user/{username}');

request.setRequestHeader('X-Api-Key', 'browser api.catalyze.io 525ad5d6993247cccb083e5a');
request.setRequestHeader('Authorization', 'Bearer 0c7f26c8-5b4a-4a32-b35a-2e249448bbf2');
request.setRequestHeader('Accept', 'application/json');

request.onreadystatechange = function () {
  if (this.readyState === 4) {
    console.log('Status:', this.status);
    console.log('Headers:', this.getAllResponseHeaders());
    console.log('Body:', this.responseText);
  }
};

request.send();
```

```objc
NSURL *baseUrl = [NSURL URLWithString:@"https://api.catalyze.io"];
AFHTTPRequestOperationManager *httpClient = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
httpClient.requestSerializer = [AFJSONRequestSerializer serializer];

[httpClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
[httpClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
[httpClient.requestSerializer setValue:@"Bearer 0c7f26c8-5b4a-4a32-b35a-2e249448bbf2" forHTTPHeaderField:@"Authorization"];
[httpClient.requestSerializer setValue:@"browser api.catalyze.io 525ad5d6993247cccb083e5a" forHTTPHeaderField:@"X-Api-Key"];

httpClient.responseSerializer = [AFHTTPResponseSerializer serializer];

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/{appId}/reset/user/{username}"];

NSDictionary *body = @{};

[httpClient GET:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### GET /{appId}/reset/user/{username}
To reset a user's password, you must first initiate the password reset process by sending their username to this route. Currently only username is supported as a valid way to reset your password. An email containing a link to a form to reset their password will be sent to the email address we have on file linked to that username.


* Parameters
    * username (required, String) ... The username of the user whose password will be reset
    * appId (required, String) ... The ID of the application


**Response (application/json)**

```json
{}
```



