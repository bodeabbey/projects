spring.jpa.database-platform=com.jumia.validator.config.SQLDialect
spring.jpa.properties.hibernate.dialect=com.jumia.validator.config.SQLDialect
spring.jpa.hibernate.ddl-auto=update
spring.datasource.hikari.schema=public
spring.datasource.driver-class-name=org.postgresql.Driver
## Postgres connectivity configuration ###
spring.datasource.url=jdbc:postgresql://${spring_host}:5432/${spring_db}
spring.datasource.username=${spring_user}
spring.datasource.password=${spring_password}