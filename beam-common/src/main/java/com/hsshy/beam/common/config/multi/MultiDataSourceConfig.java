package com.hsshy.beam.common.config.multi;
import com.hsshy.beam.common.mutidatasource.DynamicDataSource;
import com.hsshy.beam.common.mutidatasource.aop.MultiSourceExAop;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.sql.SQLException;
import java.util.HashMap;

/**
 * 多数据源配置<br/>
 * <p>
 * 注：由于引入多数据源，所以让spring事务的aop要在多数据源切换aop的后面
 *
 * @author hs
 * @Date 2019/2/12 21:58
 */
@Configuration
@ConditionalOnProperty(prefix = "beam.muti-datasource", name = "open", havingValue = "true")
@EnableTransactionManagement(order = 2)
public class MultiDataSourceConfig {

    @Bean
    @ConfigurationProperties(prefix = "beam.muti-datasource")
    public MutiDataSourceProperties mutiDataSourceProperties() {
        return new MutiDataSourceProperties();
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public HikariProperties hikariProperties() {
        return new HikariProperties();
    }

    @Bean
    public MultiSourceExAop multiSourceExAop() {
        return new MultiSourceExAop();
    }

    /**
     * guns的数据源
     */
    private HikariDataSource dataSource(HikariProperties druidProperties) {
        HikariDataSource dataSource = new HikariDataSource();
        druidProperties.config(dataSource);
        return dataSource;
    }

    /**
     * 多数据源，第二个数据源
     */
    private HikariDataSource bizDataSource(HikariProperties druidProperties, MutiDataSourceProperties mutiDataSourceProperties) {
        HikariDataSource dataSource = new HikariDataSource();
        druidProperties.config(dataSource);
        mutiDataSourceProperties.config(dataSource);
        return dataSource;
    }

    /**
     * 多数据源连接池配置
     */
    @Bean
    public DynamicDataSource mutiDataSource(HikariProperties druidProperties, MutiDataSourceProperties mutiDataSourceProperties) {

        HikariDataSource dataSourceBeam = dataSource(druidProperties);
        HikariDataSource bizDataSource = bizDataSource(druidProperties, mutiDataSourceProperties);

        try {
            dataSourceBeam.getConnection();
            bizDataSource.getConnection();
        } catch (SQLException sql) {
            sql.printStackTrace();
        }

        DynamicDataSource dynamicDataSource = new DynamicDataSource();
        HashMap<Object, Object> hashMap = new HashMap<>();
        hashMap.put(mutiDataSourceProperties.getDataSourceNames()[0], dataSourceBeam);
        hashMap.put(mutiDataSourceProperties.getDataSourceNames()[1], bizDataSource);
        dynamicDataSource.setTargetDataSources(hashMap);
        dynamicDataSource.setDefaultTargetDataSource(dataSourceBeam);
        return dynamicDataSource;
    }


}
