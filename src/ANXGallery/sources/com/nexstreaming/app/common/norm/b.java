package com.nexstreaming.app.common.norm;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* compiled from: NormTable */
public abstract class b {
    boolean addedOrUpdatedToDb = false;
    private final c tableInfo = c.a(getClass());

    @Retention(RetentionPolicy.RUNTIME)
    /* compiled from: NormTable */
    public @interface a {
        int a() default 11;
    }

    @Retention(RetentionPolicy.RUNTIME)
    /* renamed from: com.nexstreaming.app.common.norm.b$b reason: collision with other inner class name */
    /* compiled from: NormTable */
    public @interface C0000b {
    }

    @Retention(RetentionPolicy.RUNTIME)
    /* compiled from: NormTable */
    public @interface c {
    }

    @Retention(RetentionPolicy.RUNTIME)
    /* compiled from: NormTable */
    public @interface d {
    }

    @Retention(RetentionPolicy.RUNTIME)
    /* compiled from: NormTable */
    public @interface e {
    }

    @Retention(RetentionPolicy.RUNTIME)
    /* compiled from: NormTable */
    public @interface f {
    }

    @Retention(RetentionPolicy.RUNTIME)
    /* compiled from: NormTable */
    public @interface g {
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof b)) {
            return false;
        }
        boolean z = true;
        if (this == obj) {
            return true;
        }
        b bVar = (b) obj;
        if (!bVar.getTableInfo().c().equals(getTableInfo().c())) {
            return false;
        }
        if (getDbRowID() != bVar.getDbRowID()) {
            z = false;
        }
        return z;
    }

    public long getDbRowID() {
        try {
            return getTableInfo().f().b.getLong(this);
        } catch (IllegalAccessException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public c getTableInfo() {
        return this.tableInfo;
    }

    public int hashCode() {
        return (int) (getDbRowID() * ((long) getTableInfo().c().hashCode()));
    }

    public boolean wasAddedToDb() {
        return this.addedOrUpdatedToDb;
    }
}
