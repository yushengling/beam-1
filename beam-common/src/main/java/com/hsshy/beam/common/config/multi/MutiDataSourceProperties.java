package com.hsshy.beam.common.config.multi;
import com.zaxxer.hikari.HikariDataSource;

/**
 * 默认多数据源配置
 *
 * @author hs
 * @date 2019年2月12日
 */
public class MutiDataSourceProperties {

    private String url = "jdbc:mysql://localhost:3306/biz?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull";

    private String username = "deam";

    private String password = "123456";

    private long connectionTimeout = 60000L;

    private long idleTimeout = 60000L;

    private long validationTimeout = 3000L;

    private long maxLifetime = 60000L;

    private int maximumPoolSize = 60;

    private int minimumIdle = 10;

    private String filters = "log4j,wall,mergeStat";

    private String driverClassName = "com.mysql.cj.jdbc.Driver";

    private String[] dataSourceNames = {"dataSourceBeam", "dataSourceBiz"};

    public void config(HikariDataSource dataSource) {
        dataSource.setJdbcUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setDriverClassName(driverClassName);
        dataSource.setConnectionTimeout(connectionTimeout);
        dataSource.setIdleTimeout(idleTimeout);
        dataSource.setValidationTimeout(validationTimeout);
        dataSource.setMaxLifetime(maxLifetime);
        dataSource.setMaximumPoolSize(maximumPoolSize);
        dataSource.setMinimumIdle(minimumIdle);
        dataSource.setReadOnly(false);


    }


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getConnectionTimeout() {
        return connectionTimeout;
    }

    public void setConnectionTimeout(long connectionTimeout) {
        this.connectionTimeout = connectionTimeout;
    }

    public long getIdleTimeout() {
        return idleTimeout;
    }

    public void setIdleTimeout(long idleTimeout) {
        this.idleTimeout = idleTimeout;
    }

    public long getValidationTimeout() {
        return validationTimeout;
    }

    public void setValidationTimeout(long validationTimeout) {
        this.validationTimeout = validationTimeout;
    }

    public long getMaxLifetime() {
        return maxLifetime;
    }

    public void setMaxLifetime(long maxLifetime) {
        this.maxLifetime = maxLifetime;
    }

    public int getMaximumPoolSize() {
        return maximumPoolSize;
    }

    public void setMaximumPoolSize(int maximumPoolSize) {
        this.maximumPoolSize = maximumPoolSize;
    }

    public int getMinimumIdle() {
        return minimumIdle;
    }

    public void setMinimumIdle(int minimumIdle) {
        this.minimumIdle = minimumIdle;
    }

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public String getFilters() {
        return filters;
    }

    public void setFilters(String filters) {
        this.filters = filters;
    }

    public String[] getDataSourceNames() {
        return dataSourceNames;
    }

    public void setDataSourceNames(String[] dataSourceNames) {
        this.dataSourceNames = dataSourceNames;
    }
}
