---
title: Users
layout: baas_guides
---

# Users
The user model is core to Catalyze and HIPAA-compliance. It continues to evolve as we explore different ways in which Protected Health Information (PHI) and PII (Personally Identifiable Information) data can be connected and used for identification. The current user model, outlined below, represents the core elements of PII.

Fields noted with an asterisk (*) are **required** for user creation - the rest are optional, and can be used as you see fit.

NAME          |TYPE        |DESCRIPTION
--------------|------------|-------------
**userId**    |string      | Unique ID for each user. This will be generated upon creation.
**createdAt** |string      | Date when the record was created, in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`. This will be generated upon creation.
**updatedAt** |string      | Date when the record was updated, in ISO 8601 format. This will be generated upon creation and updated automatically each time the user is updated.
**username*** |string      | Username of the user. This is the name they will log in with. This will never be returned, but is required when the user is being created.
**password*** |string      | Password of the user. This will never be returned, but is required when the user is being created.
**email**     |object      | email address of the user. This is an object with multiple email addresses, marked by the following properties:
              |string      | **primary***: This is the current email address used for all identification & communication.
              |string      | **secondary**: Alternate email address.
              |string      | **work**: Work/office address.
              |string      | **other**: An older email addresses that is no longer applicable to the current app. This is not necessarily an invalid email address.
**name**      |object      | The name of the user. This is a JSON object with the following details:
              |string      | **prefix**: Mr., Mrs., Sir, Dr., etc
              |string      | **firstName**: First (given) name of the user
              |string      | **middleName**
              |string      | **lastName**: Last (family) name of the user
              |string      | **maidenName**
**extras**    |?           | To be used for whatever purpose you see fit. Any JSON type (object, array, string, etc) is legal here. Whatever you put in will be returned back on future calls. This field is not queryable - if you need to be able to query user-specific data, consider using a [Custom Class](#custom-classes).

### Create a User

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/users');

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
    "username":"username",
    "email": {
        "primary":"primary@email.com",
        "secondary":"secondary@email.com",
        "work":"work@email.com",
        "other":"other@email.com"
    },
    "name": {
        "prefix":"prefix",
        "firstName":"first name",
        "middleName":"middle name",
        "lastName":"last name",
        "maidenName":"maiden name",
        "suffix":"jr"
    },
    "phoneNumber": {
        "home":"4141112222",
        "mobile":"4143334444",
        "work":"4145556666",
        "other":"4147778888",
        "preferred":"mobile"
    },
    "dob":"2000-01-01",
    "age":21,
    "addresses":[
        {
            "type":"Home",
            "addressLine1":"1234 5th Street",
            "addressLine2":"Apt #2A",
            "city":"Milwaukee",
            "state":"Wisconsin",
            "zipCode":"53202",
            "country":"UNITED STATES",
            "geocode": {
                "latitude":1.0,
                "longitude":2.0
            }
        }
    ],
    "gender":"Male",
    "maritalStatus":"Married",
    "religion":"Baptist",
    "race":"White",
    "ethnicity":"Not Hispanic or Latino",
    "guardians":[
        {
            "guardianId":"2",
            "relationship":"father"
        }
    ],
    "confCode":"confCode",
    "languages": [
        {
            "language":"English",
            "languageMode":"Expressed written"
        }
    ],
    "socialIds":[
        {
            "handle":"@catalyzeio",
            "network":"twitter"
        }
    ],
    "mrns":[
        {
            "institutionsId":"inst_id_1",
            "mrn":"mrn1"
        },
        {
            "institutionsId":"inst_id_2",
            "mrn":"mrn2"
        }
    ],
    "healthPlans":[
        {
            "institutionsId":"inst_id",
            "type":"current",
            "groupName":"group name",
            "groupId":"1",
            "memberId":"1"
        }
    ],
    "avatar":"http://avatar.com",
    "ssn":"123456789",
    "profilePhoto":"/file/photo.png",
    "extras":{
        "extra1":"value1",
        "extra2":"value2"
    },
    "sessionToken":"25074b4e-bc7f-4ee3-aae0-f9ff0db1786e",
    "usersId":"a564ef59-085b-4803-b514-37288e32709e",
    "active":false,
    "createdAt":"2013-11-07T12:00:00Z",
    "updatedAt":"2013-11-07T12:00:00Z"
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/users"];

NSDictionary *body = @{
    @"username":@"username",
    @"email": @{
        @"primary":@"primary@email.com",
        @"secondary":@"secondary@email.com",
        @"work":@"work@email.com",
        @"other":@"other@email.com"
    },
    @"name": @{
        @"prefix":@"prefix",
        @"firstName":@"first name",
        @"middleName":@"middle name",
        @"lastName":@"last name",
        @"maidenName":@"maiden name",
        @"suffix":@"jr"
    },
    @"phoneNumber": @{
        @"home":@"4141112222",
        @"mobile":@"4143334444",
        @"work":@"4145556666",
        @"other":@"4147778888",
        @"preferred":@"mobile"
    },
    @"dob":@"2000-01-01",
    @"age":@21,
    @"addresses":@[
        @{
            @"type":@"Home",
            @"addressLine1":@"@1234 5th Street",
            @"addressLine2":@"Apt #2A",
            @"city":@"Milwaukee",
            @"state":@"Wisconsin",
            @"zipCode":@"53202",
            @"country":@"UNITED STATES",
            @"geocode": @{
                @"latitude":@1.0,
                @"longitude":@2.0
            }
        }
    ],
    @"gender":@"Male",
    @"maritalStatus":@"Married",
    @"religion":@"Baptist",
    @"race":@"White",
    @"ethnicity":@"Not Hispanic or Latino",
    @"guardians":@[
        @{
            @"guardianId":@"2",
            @"relationship":@"father"
        }
    ],
    @"confCode":@"confCode",
    @"languages": @[
        @{
            @"language":@"English",
            @"languageMode":@"Expressed written"
        }
    ],
    @"socialIds":@[
        @{
            @"handle":@"@catalyzeio",
            @"network":@"twitter"
        }
    ],
    @"mrns":@[
        @{
            @"institutionsId":@"inst_id_1",
            @"mrn":@"mrn1"
        },
        @{
            @"institutionsId":@"inst_id_2",
            @"mrn":@"mrn2"
        }
    ],
    @"healthPlans":@[
        @{
            @"institutionsId":@"inst_id",
            @"type":@"current",
            @"groupName":@"group name",
            @"groupId":@"1",
            @"memberId":@"1"
        }
    ],
    @"avatar":@"http://avatar.com",
    @"ssn":@"123456789",
    @"profilePhoto":@"/file/photo.png",
    @"extras":@{
        @"extra1":@"value1",
        @"extra2":@"value2"
    },
    @"sessionToken":@"25074b4e-bc7f-4ee3-aae0-f9ff0db1786e",
    @"usersId":@"a564ef59-085b-4803-b514-37288e32709e",
    @"active":@false,
    @"createdAt":@"2013-11-07T12:00:00Z",
    @"updatedAt":@"2013-11-07T12:00:00Z"
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


#### POST /users
This is used to create a user with associated PII (Personally Identifiable Information) details.


**Request (application/json)**

* [Headers](#headers)

```json
{
    "username":"username",
    "password":"test123",
    "email": {
        "primary":"primary@email.com",
        "secondary":"secondary@email.com",
        "work":"work@email.com",
        "other":"other@email.com"
    },
    "name": {
        "prefix":"prefix",
        "firstName":"first name",
        "middleName":"middle name",
        "lastName":"last name",
        "maidenName":"maiden name",
        "suffix":"jr"
    },
    "extras":{
        "extra1":"value1",
        "extra2":"value2"
    }
}
```

**Response (application/json)**

```json
{
    "username":"username",
    "email": {
        "primary":"primary@email.com",
        "secondary":"secondary@email.com",
        "work":"work@email.com",
        "other":"other@email.com"
    },
    "name": {
        "prefix":"prefix",
        "firstName":"first name",
        "middleName":"middle name",
        "lastName":"last name",
        "maidenName":"maiden name",
        "suffix":"jr"
    },
    "phoneNumber": {
        "home":"4141112222",
        "mobile":"4143334444",
        "work":"4145556666",
        "other":"4147778888",
        "preferred":"mobile"
    },
    "dob":"2000-01-01",
    "age":21,
    "addresses":[
        {
            "type":"Home",
            "addressLine1":"1234 5th Street",
            "addressLine2":"Apt #2A",
            "city":"Milwaukee",
            "state":"Wisconsin",
            "zipCode":"53202",
            "country":"UNITED STATES",
            "geocode": {
                "latitude":1.0,
                "longitude":2.0
            }
        }
    ],
    "gender":"Male",
    "maritalStatus":"Married",
    "religion":"Baptist",
    "race":"White",
    "ethnicity":"Not Hispanic or Latino",
    "guardians":[
        {
            "guardianId":"2",
            "relationship":"father"
        }
    ],
    "confCode":"confCode",
    "languages": [
        {
            "language":"English",
            "languageMode":"Expressed written"
        }
    ],
    "socialIds":[
        {
            "handle":"@catalyzeio",
            "network":"twitter"
        }
    ],
    "mrns":[
        {
            "institutionsId":"inst_id_1",
            "mrn":"mrn1"
        },
        {
            "institutionsId":"inst_id_2",
            "mrn":"mrn2"
        }
    ],
    "healthPlans":[
        {
            "institutionsId":"inst_id",
            "type":"current",
            "groupName":"group name",
            "groupId":"1",
            "memberId":"1"
        }
    ],
    "avatar":"http://avatar.com",
    "ssn":"123456789",
    "profilePhoto":"/file/photo.png",
    "extras":{
        "extra1":"value1",
        "extra2":"value2"
    },
    "sessionToken":"25074b4e-bc7f-4ee3-aae0-f9ff0db1786e",
    "usersId":"a564ef59-085b-4803-b514-37288e32709e",
    "active":false,
    "createdAt":"2013-11-07T12:00:00Z",
    "updatedAt":"2013-11-07T12:00:00Z"
}
```


### Retrieve a user by ID

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/users/{usersId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/users/{usersId}"];

NSDictionary *body = @{
    @"email": @{
        @"primary":@"primary@email.com",
        @"secondary":@"secondary@email.com",
        @"work":@"work@email.com",
        @"other":@"other@email.com"
    },
    @"name": @{
        @"prefix":@"prefix",
        @"firstName":@"first name",
        @"middleName":@"middle name",
        @"lastName":@"last name",
        @"maidenName":@"maiden name",
        @"suffix":@"jr"
    },
    @"extras":@{
        @"extra1":@"value1",
        @"extra2":@"value2"
    },
    @"usersId":@"a564ef59-085b-4803-b514-37288e32709e",
    @"active":@false,
    @"createdAt":@"2013-11-07T12:00:00Z",
    @"updatedAt":@"2013-11-07T12:00:00Z"
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


#### GET /users/{usersId}
This is used to retrieve a user's PII details by ID.

* Parameters
    * usersId (required, String) ... The ID of the user


**Response (application/json)**

```json
{
    "email": {
        "primary":"primary@email.com",
        "secondary":"secondary@email.com",
        "work":"work@email.com",
        "other":"other@email.com"
    },
    "name": {
        "prefix":"prefix",
        "firstName":"first name",
        "middleName":"middle name",
        "lastName":"last name",
        "maidenName":"maiden name",
        "suffix":"jr"
    },
    "extras":{
        "extra1":"value1",
        "extra2":"value2"
    },
    "usersId":"a564ef59-085b-4803-b514-37288e32709e",
    "active":false,
    "createdAt":"2013-11-07T12:00:00Z",
    "updatedAt":"2013-11-07T12:00:00Z"
}
```


### Update a user

```javascript
var request = new XMLHttpRequest();

request.open('PUT', 'https://api.catalyze.io/v2/users/{usersId}');

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
    "email": {
        "primary":"primary@email.com",
        "secondary":"secondary@email.com",
        "work":"work@email.com",
        "other":"other@email.com"
    },
    "name": {
        "prefix":"prefix",
        "firstName":"first name",
        "middleName":"middle name",
        "lastName":"last name",
        "maidenName":"maiden name",
        "suffix":"jr"
    },
    "extras":{
        "extra1":"value1",
        "extra2":"value2"
    },
    "usersId":"a564ef59-085b-4803-b514-37288e32709e",
    "active":false,
    "createdAt":"2013-11-07T12:00:00Z",
    "updatedAt":"2013-11-07T12:00:00Z"
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/users/{usersId}"];

NSDictionary *body = @{
    @"email": @{
        @"primary":@"primary@email.com",
        @"secondary":@"secondary@email.com",
        @"work":@"work@email.com",
        @"other":@"other@email.com"
    },
    @"name": @{
        @"prefix":@"prefix",
        @"firstName":@"first name",
        @"middleName":@"middle name",
        @"lastName":@"last name",
        @"maidenName":@"maiden name",
        @"suffix":@"jr"
    },
    @"extras":@{
        @"extra1":@"value1",
        @"extra2":@"value2"
    },
    @"usersId":@"a564ef59-085b-4803-b514-37288e32709e",
    @"active":@false,
    @"createdAt":@"2013-11-07T12:00:00Z",
    @"updatedAt":@"2013-11-07T12:00:00Z"
}
;

[httpClient PUT:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### PUT /users/{usersId}
This is used to update or add to a user's PII details.

* Parameters
    * usersId (required, String) ... The ID of the user

**Request (application/json)**

* [Headers](#headers)

```json
{
    "username":"username",
    "password":"test123",
    "email": {
        "primary":"primary@email.com",
        "secondary":"secondary@email.com",
        "work":"work@email.com",
        "other":"other@email.com"
    },
    "name": {
        "prefix":"prefix",
        "firstName":"first name",
        "middleName":"middle name",
        "lastName":"last name",
        "maidenName":"maiden name",
        "suffix":"jr"
    },
    "extras":{
        "extra1":"value1",
        "extra2":"value2"
    }
}
```

**Response (application/json)**

```json
{
    "email": {
        "primary":"primary@email.com",
        "secondary":"secondary@email.com",
        "work":"work@email.com",
        "other":"other@email.com"
    },
    "name": {
        "prefix":"prefix",
        "firstName":"first name",
        "middleName":"middle name",
        "lastName":"last name",
        "maidenName":"maiden name",
        "suffix":"jr"
    },
    "extras":{
        "extra1":"value1",
        "extra2":"value2"
    },
    "usersId":"a564ef59-085b-4803-b514-37288e32709e",
    "active":false,
    "createdAt":"2013-11-07T12:00:00Z",
    "updatedAt":"2013-11-07T12:00:00Z"
}
```


### Delete a user

```javascript
var request = new XMLHttpRequest();

request.open('DELETE', 'https://api.catalyze.io/v2/users/{usersId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/users/{usersId}"];

NSDictionary *body = @{};

[httpClient DELETE:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### DELETE /users/{usersId}
This is used to delete a user and all associated PII details. **Be careful using this as it cannot be reversed.**

* Parameters
    * usersId (required, String) ... The ID of the user


**Response (application/json)**

```json
{}
```


### Send Username Reminder

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/users/forgotUsername');

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

var body = {};

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/users/forgotUsername"];

NSDictionary *body = @{};

[httpClient POST:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### POST /users/forgotUsername
Send a username to a user's primary email address


**Request (application/json)**

* [Headers](#headers)

```json
{
    "email": "bobby@example.com"
}
```

**Response (application/json)**

```json
{}
```


### Retrieve Groups

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/users/{usersId}/groups');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/users/{usersId}/groups"];

NSDictionary *body = @[
    @{
        @"groupsId":@"d405a8f4-09ac-418b-adae-59a9379a2624",
        @"name":@"Read Group"
    }
]
;

[httpClient GET:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### GET /users/{usersId}/groups
Retrieve the groups of which a user is a member.

* Parameters
    * usersId (required, String) ... The ID of the user


**Response (application/json)**

```json
[
    {
        "groupsId":"d405a8f4-09ac-418b-adae-59a9379a2624",
        "name":"Read Group"
    }
]
```



