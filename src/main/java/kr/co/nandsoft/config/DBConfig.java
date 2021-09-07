package kr.co.nandsoft.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class DBConfig extends AbstractDBConfig {

    /*@Bean
    public ComboPooledDataSource javaDataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setDriverClass("com.mysql.cj.jdbc.Driver");
        dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/homepage?characterEncoding=UTF-8&serverTimezone=UTC");
        dataSource.setUser("yuihmoo");
        dataSource.setPassword("dydehf12##");
        dataSource.setMaxPoolSize(200);
        dataSource.setCheckoutTimeout(60000);
        dataSource.setMaxIdleTime(1800);
        dataSource.setIdleConnectionTestPeriod(600);

        return dataSource;
    }*/

    @Bean
    @Override
    public DataSource dataSource() {
        Map<String, String> property = new LinkedHashMap<>();
        property.put("driver", "com.mysql.cj.jdbc.Driver");
        property.put("url", "jdbc:mysql://127.0.0.1:3306/homepage?characterEncoding=UTF-8&serverTimezone=UTC");
        property.put("username", "yuihmoo");
        property.put("password", "dydehf12##");
        return super.baseDataSource(property);
    }

    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource) throws IOException {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        PathMatchingResourcePatternResolver patternResolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setConfigLocation(patternResolver.getResource("classpath:mybatisConfig.xml"));
        sqlSessionFactoryBean.setMapperLocations(patternResolver.getResources("classpath:mybatisMapper.xml"));
        return sqlSessionFactoryBean;
    }

    @Bean
    public SqlSessionTemplate sessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}