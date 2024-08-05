A bot written in dart lang to manage todos.

# Usage

## Create todo

`@TODO /ctd Some task`

Output:
```json
{
    "id": 1,
    "title": "Some task",
    "description": "",
    "createdAt": "2024-08-04T20:03:20.000",
}
```

## Setting description to a task

`@TODO /etd #1 /d Some description`

## Listing todos

`@TODO /ltd`

Output:

- Some task (#1)
> Some description
- Some other task (#2)

## Delete a todo

`@TODO /dtd #1`

# Commands

## Generate env file

dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
