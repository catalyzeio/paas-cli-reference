## Custom Classes
While Catalyze provides a whole set of data models, we also realize that we 
can't cover all possible use cases that a developer might come up with. To support
those, we have enabled the concept of custom classes that allow a developer to 
create classes specific to their use cases if not already supported by Catalyze. 
It is indeed possible to use custom classes alone and not use any of the data 
models provided by Catalyze. The only restriction that we place on the developer 
is to always use the core user / demographics model. This is to ensure that PHI 
access and use is logged, monitored, and traceable.

NAME | TYPE | DESCRIPTION
-----|------|------------
id      | string | ID of the custom class                              
name    | string | The name of the class                               
editable| Boolean | You may use custom classes to store metadata and logging information which should not be edited after being written. Setting editable to "false" prevents using PUT or DELETE routes to edit or delete custom class entries. This defaults to `true` and _can only be set when creating the custom class_.
schema  | Object | This schema is a key value schema. Such as "zipcode":null, "city":null, "state":null. Note the use of the word null. No validations will be applied to custom class entries when null values are given. You may specify "integer", "string", "boolean", "array", "object", "double", or any UMLS health vocabulary. 

### Create a New Custom Class

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/classes');

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
	"name": "MyNewClass",
	"schema": 
	{
		"zipcode": "string",
		"city": "string"
	},

	"phi": false,
	"editable": true,
	"id": "CLASS_ID_123"
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes"];

NSDictionary *body = @{
	@"name": @"MyNewClass",
	@"schema": 
	@{
		@"zipcode": @"string",
		@"city": @"string"
	},

	@"phi":@false,
	@"editable":@true,
	@"id": @"CLASS_ID_123"
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


#### POST /classes
Use this route to create a new custom class.


**Request (application/json)**

* [Headers](#headers)

```json
{
	"name": "MyNewClass",
	"schema": 
	{
		"zipcode": "string",
		"city": null
	},

	"phi": false,
	"editable": true
}
```

**Response (application/json)**

```json
{
	"name": "MyNewClass",
	"schema": 
	{
		"zipcode": "string",
		"city": "string"
	},

	"phi": false,
	"editable": true,
	"id": "CLASS_ID_123"
}
```


### Add Columns

```javascript
var request = new XMLHttpRequest();

request.open('PUT', 'https://api.catalyze.io/v2/classes/{name}');

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
	"zipcode": "string",
	"city": "string",
	"latitude": "double",
	"longitude": "double"
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}"];

NSDictionary *body = @{
	@"zipcode": @"string",
	@"city": @"string",
	@"latitude": @"double",
	@"longitude": @"double"
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


#### PUT /classes/{name}
Use this route to add columns to a custom class.

* Parameters
    * name (required, String) ... {parameter description}

**Request (application/json)**

* [Headers](#headers)

```json
{
	"latitude": "double",
	"longitude": "double"
}
```

**Response (application/json)**

```json
{
	"zipcode": "string",
	"city": "string",
	"latitude": "double",
	"longitude": "double"
}
```


### Retrieve Schema 

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/classes/{name}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}"];

NSDictionary *body = @{
	@"zipcode": @"string",
	@"city": @"string",
	@"latitude": @"double",
	@"longitude": @"double"
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


#### GET /classes/{name}
Get the schema for an existing custom class.

This route requires *Admin or dev*-level permissions.

* Parameters
    * name (required, String) ... {parameter description}


**Response (application/json)**

```json
{
	"zipcode": "string",
	"city": "string",
	"latitude": "double",
	"longitude": "double"
}
```


### Delete Class

```javascript
var request = new XMLHttpRequest();

request.open('DELETE', 'https://api.catalyze.io/v2/classes/{name}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}"];

NSDictionary *body = @{};

[httpClient DELETE:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### DELETE /classes/{name}
Use this route to delete a custom class that you created. All entries in the class will be deleted. As always, please use judiciously as this will **delete** the data from the backend completely.

This route requires *Admin or dev*-level permissions.

* Parameters
    * name (required, String) ... {parameter description}


**Response (application/json)**

```json
{}
```


### Add Entry

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/classes/{name}/entry');

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
	"id": "ENTRY_ID_123",
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	},

	"phi": false
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry"];

NSDictionary *body = @{
	@"id": @"ENTRY_ID_123",
	@"content": 
	@{
		@"zipcode": @"53202",
		@"city": @"Milwaukee"
	},

	@"phi":@false
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


#### POST /classes/{name}/entry
Use this route to add data to the custom class that you created.

NAME | TYPE | DESCRIPTION
-----|------|------------
content | object | Include the key value pairs corresponding to each data column name. For example, 
 | | {"zip_code":"53202", "city":"Milwaukee", "state":"Wisconsin", "latitude":"43.038758", "longitude":"­87.906506"}


* Parameters
    * name (required, String) ... The name of the custom class you are creating an entry for.

**Request (application/json)**

* [Headers](#headers)

```json
{
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	}
}
```

**Response (application/json)**

```json
{
	"id": "ENTRY_ID_123",
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	},

	"phi": false
}
```


### Add Entry for a User

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/classes/{name}/entry/{parentsId}');

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
	"id": "ENTRY_ID_123",
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	},

	"phi": false
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{parentsId}"];

NSDictionary *body = @{
	@"id": @"ENTRY_ID_123",
	@"content": 
	@{
		@"zipcode": @"53202",
		@"city": @"Milwaukee"
	},

	@"phi":@false
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


#### POST /classes/{name}/entry/{parentsId}
Use this route to add data for a custom class for another user.

* Parameters
    * parentsId (required, String) ... The user ID which is the parent of this custom class entry.
    * name (required, String) ... The name of the custom class you are creating an entry for.

**Request (application/json)**

* [Headers](#headers)

```json
{
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	}
}
```

**Response (application/json)**

```json
{
	"id": "ENTRY_ID_123",
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	},

	"phi": false
}
```


### Delete Entry

```javascript
var request = new XMLHttpRequest();

request.open('DELETE', 'https://api.catalyze.io/v2/classes/{name}/entry/{entryId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{entryId}"];

NSDictionary *body = @{};

[httpClient DELETE:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### DELETE /classes/{name}/entry/{entryId}
Delete a custom class entry.

* Parameters
    * name (required, String) ... The name of the custom class.
    * entryId (required, String) ... The entry ID to delete.


**Response (application/json)**

```json
{}
```


### Retrieve Entry

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/classes/{name}/entry/{entryId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{entryId}"];

NSDictionary *body = @{
	@"id": @"ENTRY_ID_123",
	@"content": 
	@{
		@"zipcode": @"53202",
		@"city": @"Milwaukee"
	},

	@"phi":@false
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


#### GET /classes/{name}/entry/{entryId}
Return a specific custom class entry.

This route requires *Supervisor, owner, or author*-level permissions.

* Parameters
    * name (required, String) ... The name of the custom class you are creating an entry for.
    * entryId (required, String) ... The name of the custom class entry to retrieve.


**Response (application/json)**

```json
{
	"id": "ENTRY_ID_123",
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	},

	"phi": false
}
```


### Update Entry

```javascript
var request = new XMLHttpRequest();

request.open('PUT', 'https://api.catalyze.io/v2/classes/{name}/entry/{entryId}');

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
	"id": "ENTRY_ID_123",
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	},

	"phi": false
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{entryId}"];

NSDictionary *body = @{
	@"id": @"ENTRY_ID_123",
	@"content": 
	@{
		@"zipcode": @"53202",
		@"city": @"Milwaukee"
	},

	@"phi":@false
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


#### PUT /classes/{name}/entry/{entryId}
Update an existing custom class entry.

This route requires *Supervisor, owner, or author*-level permissions.

* Parameters
    * name (required, String) ... The name of the custom class you are creating an entry for.
    * entryId (required, String) ... The ID of the custom class entry you are modifying.

**Request (application/json)**

* [Headers](#headers)

```json
{
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	}
}
```

**Response (application/json)**

```json
{
	"id": "ENTRY_ID_123",
	"content": 
	{
		"zipcode": "53202",
		"city": "Milwaukee"
	},

	"phi": false
}
```


### Filter Class Entries

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/classes/{name}/query');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/query"];

NSDictionary *body = @{};

[httpClient GET:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### GET /classes/{name}/query{?pageSize,pageNumber,orderBy,direction}
This route allows the data in a custom class to be filtered by certain values inside it, each passed as part of the query string by `fieldName=value`. Any number of fields can be passed, including zero (no entries would be filtered out).

Examples for an imaginary class "people":

* `?name=Bob` - entries with `name` = `"Bob"`
* `?name=Bob&gender=male&age=20` - entries with `name` = `"Bob"`, `gender` = `"male"`, and `age` = `20`

Properties of child objects can also be queried (Note: if querying a child property, ensure that every entry in that class has that property, or errors may occur) by separating the properties with a period (`.`):

* `?name.first=Bob` - would match `{"name": {"first": "Bob"}}`

To query the `createdAt` and `updatedAt` fields, the special values `@createdAt` and `@updatedAt` can be passed.


This route requires *Admin, dev, or supervisor*-level permissions.

* Parameters
    * orderBy (optional (default=@createdAt), String) ... The field by which to order the results.
    * direction (optional (default=asc), String) ... The direction in which to sort entries. "asc" and "desc" are accepted values.
    * name (required, String) ... The name of the custom class to query.
    * pageSize (optional (default=10), int) ... The number of entries to return. If not specified, defaults to 10.
    * pageNumber (optional (default=1), int) ... The number of pages of size pageSize to skip before returning entries.  If not specified, defaults to 1.


**Response (application/json)**

```json
{}
```


### Filter a User's Class Entries

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/classes/{name}/query/{usersId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/query/{usersId}"];

NSDictionary *body = @{};

[httpClient GET:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### GET /classes/{name}/query/{usersId}{?pageSize,pageNumber,orderBy,direction}
Filter class entries for only a specific user.

This route requires *Admin, dev, supervisor, or querying own ID*-level permissions.

* Parameters
    * orderBy (optional (default=@createdAt), String) ... The field by which to order the results.
    * direction (optional (default=asc), String) ... The direction in which to sort entries. "asc" and "desc" are accepted values.
    * name (required, String) ... The name of the custom class to query.
    * pageSize (optional (default=10), int) ... The number of entries to return. If not specified, defaults to 10.
    * usersId (required, String) ... The user whose data will be queried.
    * pageNumber (optional (default=1), int) ... The number of pages of size pageSize to skip before returning entries.  If not specified, defaults to 1.


**Response (application/json)**

```json
{}
```


### Query Class Entries

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/classes/{name}/query');

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

var body = [
    {
        "id": "ENTRY_ID_123",
        "content": 
        {
            "suite": "spades",
            "value": 7
        },
        "phi": false
    },
    {
        "id": "ENTRY_ID_456",
        "content": 
        {
            "suite": "spades",
            "value": 8
        },
        "phi": false
    }
]
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/query"];

NSDictionary *body = @[
    @{
        @"id": @"ENTRY_ID_123",
        @"content": 
        @{
            @"suite": @"spades",
            @"value": 7
        },
        @"phi":@false
    },
    @{
        @"id": @"ENTRY_ID_456",
        @"content": 
        @{
            @"suite": @"spades",
            @"value": 8
        },
        @"phi":@false
    }
]
;

[httpClient POST:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### POST /classes/{name}/query{?pageSize,pageNumber,orderBy,direction}
This route allows the data in a custom class to be queried via an arbitrary `expression`, using a custom syntax. This expression, built as JSON, is sent as the body of the `POST` request.

In general, an `expression` consists of an object with a single property, the `operator`, with the  value of that property being the array of `arguments` to pass to that operator.

![http://i.imgur.com/Gemb7Lg.png](http://i.imgur.com/Gemb7Lg.png)

There are two types of `expression`s. The first type is **comparative** - an expression that names a field and compares it to a scalar value.

![http://i.imgur.com/SzCAoTr.png](http://i.imgur.com/SzCAoTr.png)

The field name can be either a top-level field of the custom class (e.g. `"age"`) or a period-separated selector to a child object's property (e.g. `"extras.favorites.color"`). Note: if querying a child property, ensure that every entry in that class has that property, or errors may occur.

The available comparative operators are:

* `=`, `!=` - Equality, Inequality
* `<`, `>`, `<=`, `>=` - Value Comparisons

The second type of `expression` is **logical** - an expression that contains other expressions.

![http://i.imgur.com/dkEhgNa.png](http://i.imgur.com/dkEhgNa.png)

The two logical operators - `and` and `or` - will match entries for which all of the nested `expression`s are true (for `and`), or at least one is true (for `or`). Logical expressions can be nested.

Some examples:

* Matching all males in an imaginary class "people"
    
    ```
    { "=": ["gender", "male"] }
    ```

* Matching males between ages 18 and 35 (inclusive)
    
    ```
    {
        "and": [
            { "=": ["gender", "male"] },
            { ">=": ["age", 18] },
            { "<=": ["age", 35] }
        ]
    }
    ```

* Matching women in Milwaukee, WI whose favorite color is blue or aren't named "Jenny"

    ```
    {
        "and": [
            { "=": ["gender", "female"] },
            { "=": ["address.city", "Milwaukee"] },
            { "=": ["address.state", "WI"] },
            { "or": [
                { "=": ["extras.favorites.color", "blue"] },
                { "!=": ["name.first", "Jenny"] }
            ]}
        ]
    }
    ```

To query the `createdAt` and `updatedAt` fields, the special values `@createdAt` and `@updatedAt` can be passed.


This route requires *Admin, dev, or supervisor*-level permissions.

* Parameters
    * orderBy (optional (default=@createdAt), String) ... The field by which to order the results.
    * direction (optional (default=asc), String) ... The direction in which to sort entries. "asc" and "desc" are accepted values.
    * name (required, String) ... The name of the custom class
    * pageSize (optional (default=10), int) ... The number of entries to return. If not specified, defaults to 10.
    * pageNumber (optional (default=1), int) ... The number of pages of size pageSize to skip before returning entries.  If not specified, defaults to 1.

**Request (application/json)**

* [Headers](#headers)

```json
{ "and": [
    { "=": ["suite", "clubs"] },
    { ">": ["value", 6] },
    { "<": ["value", 9] }
]}
```

**Response (application/json)**

```json
[
    {
        "id": "ENTRY_ID_123",
        "content": 
        {
            "suite": "spades",
            "value": 7
        },
        "phi": false
    },
    {
        "id": "ENTRY_ID_456",
        "content": 
        {
            "suite": "spades",
            "value": 8
        },
        "phi": false
    }
]
```


### Query a User's Class Entries

```javascript
var request = new XMLHttpRequest();

request.open('POST', 'https://api.catalyze.io/v2/classes/{name}/query/{usersId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/query/{usersId}"];

NSDictionary *body = @{};

[httpClient POST:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### POST /classes/{name}/query/{usersId}{?pageSize,pageNumber,orderBy,direction}
Query a user's custom class entries in a specific class, using an advanced query.

This route requires *Admin, dev, supervisor, or querying own ID*-level permissions.

* Parameters
    * orderBy (optional (default=@createdAt), String) ... The field by which to order the results.
    * direction (optional (default=asc), String) ... The direction in which to sort entries. "asc" and "desc" are accepted values.
    * name (required, String) ... The name of the custom class to query.
    * pageSize (optional (default=10), int) ... The number of entries to return. If not specified, defaults to 10.
    * usersId (required, String) ... The user whose data will be queried.
    * pageNumber (optional (default=1), int) ... The number of pages of size pageSize to skip before returning entries.  If not specified, defaults to 1.

**Request (application/json)**

* [Headers](#headers)

```json
{}
```

**Response (application/json)**

```json
{}
```


### Export Data

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/classes/{name}/export');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/export"];

NSDictionary *body = @[
	@{
		@"_id": @"abc123",
		@"color": @"red",
		@"code": @"F00"
	},

	@{
		@"_id": @"def456",
		@"color": @"green",
		@"code": @"0F0"
	},

	@{
		@"_id": @"ghi789",
		@"color": @"blue",
		@"code": @"00F"
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


#### GET /classes/{name}/export
Export a JSON array of class entries.

This route requires *Admin/dev*-level permissions.

* Parameters
    * name (required, String) ... {parameter description}


**Response (application/json)**

```json
[
	{
		"_id": "abc123",
		"color": "red",
		"code": "F00"
	},

	{
		"_id": "def456",
		"color": "green",
		"code": "0F0"
	},

	{
		"_id": "ghi789",
		"color": "blue",
		"code": "00F"
	}
]
```


### Add Entry Reference

```javascript
var request = new XMLHttpRequest();

request.open('PUT', 'https://api.catalyze.io/v2/classes/{name}/entry/{entryId}/ref/{refName}');

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
	"content": 
	{
		"referencesArray": 
		[
			{
				"type": "__ref",
				"class": "REFERENCED_CLASS_NAME_WITHIN_SAME_APP",
				"entryId": "REFERENCED_OBJECT_ID"
			},

			{
				"type": "__ref",
				"class": "REFERENCED_CLASS_NAME_2_WITHIN_SAME_APP",
				"entryId": "REFERENCED_OBJECT_ID_2"
			},

			{
				"type": "__ref",
				"class": "NAME_OF_CLASS_THIS_NEW_REFERENCE_BELONGS_TO",
				"entryId": "ID_OF_NEW_REFERENCED_OBJECT"
			}
		],

		"name": "nameOfEntry"
	},

	"entryId": "ENTRY_ID_123",
	"parentId": "USER_ID_123",
	"phi": false
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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{entryId}/ref/{refName}"];

NSDictionary *body = @{
	@"content": 
	@{
		@"referencesArray": 
		@[
			@{
				@"type": @"__ref",
				@"class": @"REFERENCED_CLASS_NAME_WITHIN_SAME_APP",
				@"entryId": @"REFERENCED_OBJECT_ID"
			},

			@{
				@"type": @"__ref",
				@"class": @"REFERENCED_CLASS_NAME_2_WITHIN_SAME_APP",
				@"entryId": @"REFERENCED_OBJECT_ID_2"
			},

			@{
				@"type": @"__ref",
				@"class": @"NAME_OF_CLASS_THIS_NEW_REFERENCE_BELONGS_TO",
				@"entryId": @"ID_OF_NEW_REFERENCED_OBJECT"
			}
		],

		@"name": @"nameOfEntry"
	},

	@"entryId": @"ENTRY_ID_123",
	@"parentId": @"USER_ID_123",
	@"phi":@false
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


#### PUT /classes/{name}/entry/{entryId}/ref/{refName}
Add a reference to a custom class entry.

* Parameters
    * name (required, String) ... The name of the base custom class.
    * refName (required, String) ... The name of the reference which refers to the entry.
    * entryId (required, String) ... The entry in the custom class to create a reference on.

**Request (application/json)**

* [Headers](#headers)

```json
[
	{
		"type": "__ref",
		"class": "NAME_OF_CLASS_THIS_NEW_REFERENCE_BELONGS_TO",
		"entryId": "ID_OF_NEW_REFERENCED_OBJECT"
	}
]
```

**Response (application/json)**

```json
{
	"content": 
	{
		"referencesArray": 
		[
			{
				"type": "__ref",
				"class": "REFERENCED_CLASS_NAME_WITHIN_SAME_APP",
				"entryId": "REFERENCED_OBJECT_ID"
			},

			{
				"type": "__ref",
				"class": "REFERENCED_CLASS_NAME_2_WITHIN_SAME_APP",
				"entryId": "REFERENCED_OBJECT_ID_2"
			},

			{
				"type": "__ref",
				"class": "NAME_OF_CLASS_THIS_NEW_REFERENCE_BELONGS_TO",
				"entryId": "ID_OF_NEW_REFERENCED_OBJECT"
			}
		],

		"name": "nameOfEntry"
	},

	"entryId": "ENTRY_ID_123",
	"parentId": "USER_ID_123",
	"phi": false
}
```


### Delete Entry Reference

```javascript
var request = new XMLHttpRequest();

request.open('DELETE', 'https://api.catalyze.io/v2/classes/{name}/entry/{entryId}/ref/{refName}/{refId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{entryId}/ref/{refName}/{refId}"];

NSDictionary *body = @{};

[httpClient DELETE:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    NSLog(@"Status: %ld", [[operation response] statusCode]);
    NSLog(@"Response: %@", [NSJSONSerialization JSONObjectWithData:[operation responseData] options:0 error:nil]);
}];
```


#### DELETE /classes/{name}/entry/{entryId}/ref/{refName}/{refId}
Delete a reference from an entry.

* Parameters
    * name (required, String) ... The name of the base custom class.
    * refId (required, String) ... The ID of the reference that should be deleted.
    * refName (required, String) ... The name of the reference which applies to this custom class entry.
    * entryId (required, String) ... The ID of the custom class entry which has the reference.


**Response (application/json)**

```json
{}
```


### Retrieve All Entry References

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/classes/{name}/entry/{entryId}/ref/{refName}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{entryId}/ref/{refName}"];

NSDictionary *body = @[
	@{
		@"content": 
		@{
			@"key1-1": @"value1-1",
			@"key1-2": @"value1-2"
		}
	},

	@{
		@"content": 
		@{
			@"key2-1": @"value2-1",
			@"key2-2": @"value2-2"
		}
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


#### GET /classes/{name}/entry/{entryId}/ref/{refName}
/cc/getReferenceDescription.json

* Parameters
    * name (required, String) ... The name of the custom class you are querying.
    * refName (required, String) ... The reference name which you are searching for based upon this entry ID.
    * entryId (required, String) ... The ID of the custom class entry you are referencing


**Response (application/json)**

```json
[
	{
		"content": 
		{
			"key1-1": "value1-1",
			"key1-2": "value1-2"
		}
	},

	{
		"content": 
		{
			"key2-1": "value2-1",
			"key2-2": "value2-2"
		}
	}
]
```


### Retrieve Entity Reference

```javascript
var request = new XMLHttpRequest();

request.open('GET', 'https://api.catalyze.io/v2/classes/{name}/entry/{entryId}/ref/{refName}/{refId}');

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

NSString *url = [NSString stringWithFormat:@"/v2%@",@"/classes/{name}/entry/{entryId}/ref/{refName}/{refId}"];

NSDictionary *body = @{
	@"content": 
	@{
		@"REFERENCED_CLASS_KEY_1": @"REFERENCED_CLASS_VAL_1",
		@"REFERENCED_CLASS_KEY_2": @"REFERENCED_CLASS_VAL_2"
	},

	@"id": @"REFERENCED_ENTRY_ID_123",
	@"parentId": @"USER_ID_123",
	@"phi":@false
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


#### GET /classes/{name}/entry/{entryId}/ref/{refName}/{refId}
Retrieve a specific reference for an entry.

* Parameters
    * name (required, String) ... The name of the custom class you are querying.
    * refId (required, String) ... The ID of the reference which you are querying.
    * refName (required, String) ... The name of the reference you are querying.
    * entryId (required, String) ... The ID of the custom class entry you are searching for references.


**Response (application/json)**

```json
{
	"content": 
	{
		"REFERENCED_CLASS_KEY_1": "REFERENCED_CLASS_VAL_1",
		"REFERENCED_CLASS_KEY_2": "REFERENCED_CLASS_VAL_2"
	},

	"id": "REFERENCED_ENTRY_ID_123",
	"parentId": "USER_ID_123",
	"phi": false
}
```



