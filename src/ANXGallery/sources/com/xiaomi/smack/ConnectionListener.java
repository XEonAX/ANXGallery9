package com.xiaomi.smack;

public interface ConnectionListener {
    void connectionClosed(Connection connection, int i, Exception exc);

    void connectionStarted(Connection connection);

    void reconnectionFailed(Connection connection, Exception exc);

    void reconnectionSuccessful(Connection connection);
}
