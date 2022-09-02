# SwapService


## Challenge:
 - Create a Phoenix API as a service retrieve all issues from a certain GitHub repository and returns a json data.
 
## Route:
 - Post -> /api/repository/


## Json returned:


  ###  - Body Json input:
  ```
  { 
    user: nome_usuario

    repository: nome_repositorio
  }

  ```
  ###  - Body Json expected:
  ```
  { 

    user: nome_usuario

    repository: nome_repositorio

     issues: 

     [

        {title, author and labels},

        {title, author and labels},
        ...

     ],

     contributors: 

     [

        {name, user, qtd_commits},

        {name, user, qtd_commits},
        ....

     ]

   }
  ```
 
## Test:

 Folder test: test/swap_service_web/controllers/controllers_test.exs
- Run tests with mix test
 

## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`
 
