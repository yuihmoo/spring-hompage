package kr.co.nandsoft.config;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.util.Map;

public abstract class AbstractDBConfig {

    public DataSource baseDataSource(Map<String, String> prop) {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(prop.get("driver"));
        dataSource.setUrl(prop.get("url"));
        dataSource.setUsername(prop.get("username"));
        dataSource.setPassword(prop.get("password"));
        return dataSource;
    }

    public abstract DataSource dataSource();
}
