# Open Todoist

![logo](./public/open_todoist_logo.png)

This project is a clone of todoist to benefit who wants to get a open source project and get the same result of this
amazing tecnology

## running project

config dotenv variables:
```
db_user=root
db_pass=root
db_host=postgres
```

starting server rails and webpack
```
sudo docker-compose up --build
```

create and migrate database:
```
sudo docker-compose run --rm web_app rails db:create db:migrate
```

## How run tests

rspec
```
sudo docker-compose run --rm web_app rspec
```

rubocop
```
sudo docker-compose run --rm web_app rubocop -A
```

brakeman
```
sudo docker-compose run --rm web_app brakeman
```

## API

### Authenticity token

<details>
  <summary>Get</summary>

  - curl:
    ```shell
    curl -X "GET" 'http://localhost:3000' --cookie-jar cookie | grep csrf
    ```

  - return:
    ```HTML
    <meta name="csrf-token" content="+io2dtE6WwojAf+w1Uc0zuObAOOZ7INTyGT5M5wjagWEUw3O5M3fZrun4HHbLYouFDhn5rl5Seuo1PJgCTNJTg==" />
    ```
</details>

### Session

<details>
  <summary>Create</summary>

  - curl:
    ```shell
    curl -kv -H 'Content-Type: application/json' -d '{"users": { "email": "root@root.com", "password": "123456"}, "authenticity_token": "eZHlcA3MW7i4Kfl6lo4i7wvE6V54x3SZcdIvWYXT5idHpnjTFgA+rjIzFbp78L3jnXLmAnVcSEA2rBHpw7JbOA==" }' --cookie cookie -X 'POST' "http://localhost:3000/api/v1/sessions" | jq
    ```
  
  - status_code: 201 Created

  - return:
    ```json
    {
      "authentication_token": "2yPsyWBjLPci4xoyzaG4"
    }
    ```
</details>

### Projects

<details>
  <summary>Get</summary>
  
  - curl:
    ```shell
    curl -kv -H 'Content-Type: application/json' -H 'token: 2yPsyWBjLPci4xoyzaG4' --cookie cookie -X 'GET' "http://localhost:3000/api/v1/projects" | jq
    ```

    - status_code: 200 Ok

    - return:
      ```json
      []
      ```
</details>
