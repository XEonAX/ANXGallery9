package org.apache.thrift.protocol;

public class TField {
    public final short id;
    public final String name;
    public final byte type;

    public TField() {
        this("", 0, 0);
    }

    public TField(String str, byte b, short s) {
        this.name = str;
        this.type = b;
        this.id = s;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("<TField name:'");
        sb.append(this.name);
        sb.append("' type:");
        sb.append(this.type);
        sb.append(" field-id:");
        sb.append(this.id);
        sb.append(">");
        return sb.toString();
    }
}
