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


    /*study
       추상화 클래스인 AbstractDBConfig 를 상속받는 DBConfig 클래스를 생성.
       Spring Bean 에 등록할 DataSource property 추가. (driver, url, username, password 등) 외에 다른 설정 값도 있다.
       SqlSessionFactoryBean = SqlSession 을 생성하는 구성 요소이다.
       SqlSessionTemplate = Mybatis 를 사용하여 직접 데이터 베이스에 엑세스할 객체이다. sqlSession 은 Mapper 파일에서 실행할 쿼리문을 가져와 실행함.
       SqlSessionFactoryBean 에 DataSource 를 set.
       SqlSessionFactoryBean 에 ConfigLocation 등록(xml 경로).
       SqlSessionFactoryBean 에 MapperLocation 등록(xml 경로).
       SqlSessionTemplate 을 Spring Bean 에 등록.
     */

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