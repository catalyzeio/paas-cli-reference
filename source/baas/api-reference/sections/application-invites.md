---
title: Authentication Invites
layout: baas_guides
---

# Application Invites

Applications have the ability to be marked invite-only, meaning that any user that signs up for your application must have a valid inviteCode that you send by email. This invite code must be sent with the User model on creation under the key inviteCode. After initial creation this code is never used again. But administrators of applications need a way to send out invites and manage existing ones. The following routes explain how to send invites by email as well as view and cancel any outstanding invites. Please note that once an invite is used it cannot be viewed or deleted. You will have to manually delete that User if a mistake was made. These routes are restricted to those with supervisor permissions or higher. Here are the parameters for the `Invite` model:

NAME | TYPE | DESCRIPTION
-----|------|------------
inviteId | string | Internal ID for this particular invite. This should not be usedfor signing up, you must use `inviteCode`.
inviteCode | string | Ihe code that the user will send along with the User object on User creation
email | string | Ihe email address to send the invitation to
appId | string | Ihe ID of the application that the user with the given `email` address was invited to
used | boolean | Flag indicating if this invite has already been used or not

### Invite a user to an application

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/app/{appId}/invite');

request.setRequestHeader('X-Api-Key', 'browser api.catalyze.io 525ad5d6993247cccb083e5a');
request.setRequestHeader('Authorization', 'Bearer 0c7f26c8-5b4a-4a32-b35a-2e249448bbf2');
request.setRequestHeader('Accept', 'application/json');
request.setRequestHeader('Content-Type', 'application/json');

request.onreadystatechange = function () {
  if (this.readyState === 4) {
    console.log('Status:', this.status);
    console.log('Headers:', this.getAllResponseHeaders());
    console.log('Body:', this.responseText);
  }
};

var body = {
    "inviteId":"e1200bd6-b0de-461a-893f-25d6c36b277b",
    "inviteCode":"8216502f-e57f-40c8-9bd1-833d99fb0854",
    "email":"inviteMe@catalyze.io",
    "appId":"bf9e0920-e41b-4705-b66b-87e4dc11cd46",
    "used":false
}
;

request.send(JSON.stringify(body));
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/app/{appId}/invite"];

NSDictionary *body = @{
    @"inviteId":@"e1200bd6-b0de-461a-893f-25d6c36b277b",
    @"inviteCode":@"8216502f-e57f-40c8-9bd1-833d99fb0854",
    @"email":@"inviteMe@catalyze.io",
    @"appId":@"bf9e0920-e41b-4705-b66b-87e4dc11cd46",
    @"used":@false
}
;

[httpClient POST:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### POST /app/{appId}/invite
Use this route to invite a user to your application by email.

This route requires *admin,dev*-level permissions.

* Parameters
    * appId (required, String) ... The ID of the application

**Request (application/json)**

* [Headers](#headers)

```json
{
    "email":"inviteMe@catalyze.io"
}
```

**Response (application/json)**

```json
{
    "inviteId":"e1200bd6-b0de-461a-893f-25d6c36b277b",
    "inviteCode":"8216502f-e57f-40c8-9bd1-833d99fb0854",
    "email":"inviteMe@catalyze.io",
    "appId":"bf9e0920-e41b-4705-b66b-87e4dc11cd46",
    "used":false
}
```


### Retrieve Invite

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/app/{appId}/invite/{inviteId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/app/{appId}/invite/{inviteId}"];

NSDictionary *body = @{
    @"inviteId":@"e1200bd6-b0de-461a-893f-25d6c36b277b",
    @"inviteCode":@"8216502f-e57f-40c8-9bd1-833d99fb0854",
    @"email":@"inviteMe@catalyze.io",
    @"appId":@"bf9e0920-e41b-4705-b66b-87e4dc11cd46",
    @"used":@false
}
;

[httpClient GET:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### GET /app/{appId}/invite/{inviteId}
Use this route to retrieve a specific invite by its ID. This invite must be unused.

* Parameters
    * appId (required, String) ... The ID of the application
    * inviteId (required, String) ... The ID of the invite


**Response (application/json)**

```json
{
    "inviteId":"e1200bd6-b0de-461a-893f-25d6c36b277b",
    "inviteCode":"8216502f-e57f-40c8-9bd1-833d99fb0854",
    "email":"inviteMe@catalyze.io",
    "appId":"bf9e0920-e41b-4705-b66b-87e4dc11cd46",
    "used":false
}
```


### Delete Invite

```javascript
var request = new XMLHttpRequest();

request.open('DELETE', 'https://api.catalyze.io/v2/app/{appId}/invite/{inviteId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/app/{appId}/invite/{inviteId}"];

NSDictionary *body = @{};

[httpClient DELETE:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### DELETE /app/{appId}/invite/{inviteId}
This will delete an invite by its ID if it is unused. If the invite has been used, this has no effect.

This route requires *admin,dev*-level permissions.

* Parameters
    * appId (required, String) ... The ID of the application
    * inviteId (required, String) ... The ID of the invite


**Response (application/json)**

```json
{}
```



