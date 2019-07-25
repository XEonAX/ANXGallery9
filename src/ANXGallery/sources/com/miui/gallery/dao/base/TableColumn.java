package com.miui.gallery.dao.base;

public class TableColumn {
    protected String defaultValue;
    protected boolean isUnique = false;
    protected String name;
    protected String type;

    public TableColumn(String str, String str2) {
        this.name = str;
        this.type = str2;
    }

    public TableColumn(String str, String str2, String str3) {
        this.name = str;
        this.type = str2;
        this.defaultValue = str3;
    }

    public TableColumn(String str, String str2, boolean z) {
        this.name = str;
        this.type = str2;
        this.isUnique = z;
    }
}
