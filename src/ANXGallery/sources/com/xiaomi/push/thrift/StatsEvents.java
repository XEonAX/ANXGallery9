package com.xiaomi.push.thrift;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.apache.thrift.TBase;
import org.apache.thrift.TBaseHelper;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TList;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;

public class StatsEvents implements Serializable, Cloneable, TBase<StatsEvents, Object> {
    private static final TField EVENTS_FIELD_DESC = new TField("", 15, 3);
    private static final TField OPERATOR_FIELD_DESC = new TField("", 11, 2);
    private static final TStruct STRUCT_DESC = new TStruct("StatsEvents");
    private static final TField UUID_FIELD_DESC = new TField("", 11, 1);
    public List<StatsEvent> events;
    public String operator;
    public String uuid;

    public StatsEvents() {
    }

    public StatsEvents(String str, List<StatsEvent> list) {
        this();
        this.uuid = str;
        this.events = list;
    }

    public int compareTo(StatsEvents statsEvents) {
        if (!getClass().equals(statsEvents.getClass())) {
            return getClass().getName().compareTo(statsEvents.getClass().getName());
        }
        int compareTo = Boolean.valueOf(isSetUuid()).compareTo(Boolean.valueOf(statsEvents.isSetUuid()));
        if (compareTo != 0) {
            return compareTo;
        }
        if (isSetUuid()) {
            int compareTo2 = TBaseHelper.compareTo(this.uuid, statsEvents.uuid);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        int compareTo3 = Boolean.valueOf(isSetOperator()).compareTo(Boolean.valueOf(statsEvents.isSetOperator()));
        if (compareTo3 != 0) {
            return compareTo3;
        }
        if (isSetOperator()) {
            int compareTo4 = TBaseHelper.compareTo(this.operator, statsEvents.operator);
            if (compareTo4 != 0) {
                return compareTo4;
            }
        }
        int compareTo5 = Boolean.valueOf(isSetEvents()).compareTo(Boolean.valueOf(statsEvents.isSetEvents()));
        if (compareTo5 != 0) {
            return compareTo5;
        }
        if (isSetEvents()) {
            int compareTo6 = TBaseHelper.compareTo((List) this.events, (List) statsEvents.events);
            if (compareTo6 != 0) {
                return compareTo6;
            }
        }
        return 0;
    }

    public boolean equals(StatsEvents statsEvents) {
        if (statsEvents == null) {
            return false;
        }
        boolean isSetUuid = isSetUuid();
        boolean isSetUuid2 = statsEvents.isSetUuid();
        if ((isSetUuid || isSetUuid2) && (!isSetUuid || !isSetUuid2 || !this.uuid.equals(statsEvents.uuid))) {
            return false;
        }
        boolean isSetOperator = isSetOperator();
        boolean isSetOperator2 = statsEvents.isSetOperator();
        if ((isSetOperator || isSetOperator2) && (!isSetOperator || !isSetOperator2 || !this.operator.equals(statsEvents.operator))) {
            return false;
        }
        boolean isSetEvents = isSetEvents();
        boolean isSetEvents2 = statsEvents.isSetEvents();
        return (!isSetEvents && !isSetEvents2) || (isSetEvents && isSetEvents2 && this.events.equals(statsEvents.events));
    }

    public boolean equals(Object obj) {
        if (obj != null && (obj instanceof StatsEvents)) {
            return equals((StatsEvents) obj);
        }
        return false;
    }

    public int hashCode() {
        return 0;
    }

    public boolean isSetEvents() {
        return this.events != null;
    }

    public boolean isSetOperator() {
        return this.operator != null;
    }

    public boolean isSetUuid() {
        return this.uuid != null;
    }

    public void read(TProtocol tProtocol) throws TException {
        tProtocol.readStructBegin();
        while (true) {
            TField readFieldBegin = tProtocol.readFieldBegin();
            if (readFieldBegin.type == 0) {
                tProtocol.readStructEnd();
                validate();
                return;
            }
            switch (readFieldBegin.id) {
                case 1:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.uuid = tProtocol.readString();
                        break;
                    }
                case 2:
                    if (readFieldBegin.type != 11) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        this.operator = tProtocol.readString();
                        break;
                    }
                case 3:
                    if (readFieldBegin.type != 15) {
                        TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                        break;
                    } else {
                        TList readListBegin = tProtocol.readListBegin();
                        this.events = new ArrayList(readListBegin.size);
                        for (int i = 0; i < readListBegin.size; i++) {
                            StatsEvent statsEvent = new StatsEvent();
                            statsEvent.read(tProtocol);
                            this.events.add(statsEvent);
                        }
                        tProtocol.readListEnd();
                        break;
                    }
                default:
                    TProtocolUtil.skip(tProtocol, readFieldBegin.type);
                    break;
            }
            tProtocol.readFieldEnd();
        }
    }

    public StatsEvents setOperator(String str) {
        this.operator = str;
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("StatsEvents(");
        sb.append("uuid:");
        if (this.uuid == null) {
            sb.append("null");
        } else {
            sb.append(this.uuid);
        }
        if (isSetOperator()) {
            sb.append(", ");
            sb.append("operator:");
            if (this.operator == null) {
                sb.append("null");
            } else {
                sb.append(this.operator);
            }
        }
        sb.append(", ");
        sb.append("events:");
        if (this.events == null) {
            sb.append("null");
        } else {
            sb.append(this.events);
        }
        sb.append(")");
        return sb.toString();
    }

    public void validate() throws TException {
        if (this.uuid == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Required field 'uuid' was not present! Struct: ");
            sb.append(toString());
            throw new TProtocolException(sb.toString());
        } else if (this.events == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Required field 'events' was not present! Struct: ");
            sb2.append(toString());
            throw new TProtocolException(sb2.toString());
        }
    }

    public void write(TProtocol tProtocol) throws TException {
        validate();
        tProtocol.writeStructBegin(STRUCT_DESC);
        if (this.uuid != null) {
            tProtocol.writeFieldBegin(UUID_FIELD_DESC);
            tProtocol.writeString(this.uuid);
            tProtocol.writeFieldEnd();
        }
        if (this.operator != null && isSetOperator()) {
            tProtocol.writeFieldBegin(OPERATOR_FIELD_DESC);
            tProtocol.writeString(this.operator);
            tProtocol.writeFieldEnd();
        }
        if (this.events != null) {
            tProtocol.writeFieldBegin(EVENTS_FIELD_DESC);
            tProtocol.writeListBegin(new TList(12, this.events.size()));
            for (StatsEvent write : this.events) {
                write.write(tProtocol);
            }
            tProtocol.writeListEnd();
            tProtocol.writeFieldEnd();
        }
        tProtocol.writeFieldStop();
        tProtocol.writeStructEnd();
    }
}
