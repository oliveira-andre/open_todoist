# Open Todoist

![logo](./public/open_todoist_logo.png)

This project is a clone of todoist to benefit who wants to get a open source project and get the same result of this
amazing tecnology

## running project

if you need help with database postgres, you can install it easily on docker [using this image](https://gist.github.com/oliveira-andre/315ce4e915a24e0dfc9f88484c80be29)

---

going to ruby version 2.7.1

```
rbenv shell 2.7.1
```

installing dependencies

```
bundle install
```

config database.yml or create a dotenv my example:

```
db_user=root
db_pass=root
db_host=127.0.0.1
```

starting server rails and webpack

```
bundle exec foreman start
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
