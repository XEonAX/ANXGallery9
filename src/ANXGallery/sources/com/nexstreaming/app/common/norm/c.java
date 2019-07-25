package com.nexstreaming.app.common.norm;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* compiled from: NormTableInfo */
public class c {
    private static Map<Class<? extends b>, c> g = new HashMap();
    private final String[] a;
    private final String[] b;
    private final NormColumnInfo[] c;
    private final String d;
    private final String[] e;
    private final NormColumnInfo f;

    private c(Class<? extends b> cls) {
        StringBuilder sb = new StringBuilder();
        StringBuilder sb2 = new StringBuilder();
        this.d = a.camelCaseToLCUnderscore(cls.getSimpleName());
        sb.append("CREATE TABLE ");
        sb.append(this.d);
        sb.append(" (\n    ");
        sb2.append("DROP TABLE IF EXISTS ");
        sb2.append(this.d);
        Field[] declaredFields = cls.getDeclaredFields();
        int i = 0;
        for (Field a2 : declaredFields) {
            if (a(a2)) {
                i++;
            }
        }
        this.c = new NormColumnInfo[(declaredFields.length - i)];
        this.e = new String[(declaredFields.length - i)];
        NormColumnInfo normColumnInfo = null;
        String[] strArr = null;
        String[] strArr2 = null;
        int i2 = 0;
        int i3 = -1;
        for (Field field : declaredFields) {
            if (!a(field)) {
                i3++;
                NormColumnInfo normColumnInfo2 = new NormColumnInfo(field);
                this.c[i3] = normColumnInfo2;
                this.e[i3] = normColumnInfo2.a;
                if (normColumnInfo2.h) {
                    if (strArr == null) {
                        strArr = new String[declaredFields.length];
                        strArr2 = new String[declaredFields.length];
                    }
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("CREATE INDEX idx_");
                    sb3.append(normColumnInfo2.a);
                    sb3.append(" ON ");
                    sb3.append(this.d);
                    sb3.append("( ");
                    sb3.append(normColumnInfo2.a);
                    sb3.append(")");
                    strArr[i2] = sb3.toString();
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("DROP INDEX IF EXISTS idx_");
                    sb4.append(normColumnInfo2.a);
                    strArr2[i2] = sb4.toString();
                    i2++;
                }
                if (normColumnInfo2.g) {
                    normColumnInfo = normColumnInfo2;
                }
                if (i3 > 0) {
                    sb.append(",\n    ");
                }
                sb.append(normColumnInfo2.a);
                sb.append(' ');
                switch (normColumnInfo2.c) {
                    case INT:
                    case LONG:
                    case BOOL:
                        if (!normColumnInfo2.g) {
                            sb.append("INTEGER");
                            break;
                        } else {
                            sb.append("INTEGER PRIMARY KEY");
                            break;
                        }
                    case DOUBLE:
                    case FLOAT:
                        sb.append("REAL");
                        break;
                    case ENUM:
                    case TEXT:
                    case JSON:
                        sb.append("TEXT");
                        break;
                    case BLOB:
                        sb.append("BLOB");
                        break;
                }
                if (normColumnInfo2.d) {
                    sb.append(" UNIQUE");
                }
                if (normColumnInfo2.e) {
                    sb.append(" NOT NULL");
                }
            }
        }
        this.f = normColumnInfo;
        sb.append(')');
        int i4 = i2 + 1;
        this.a = new String[i4];
        this.a[0] = sb.toString();
        if (i2 > 0) {
            System.arraycopy(strArr, 0, this.a, 1, i2);
        }
        this.b = new String[i4];
        this.b[i2] = sb2.toString();
        if (i2 > 0) {
            System.arraycopy(strArr2, 0, this.b, 0, i2);
        }
    }

    public static c a(Class<? extends b> cls) {
        c cVar = (c) g.get(cls);
        if (cVar != null) {
            return cVar;
        }
        c cVar2 = new c(cls);
        g.put(cls, cVar2);
        return cVar2;
    }

    private boolean a(Field field) {
        if (field.isSynthetic()) {
            return true;
        }
        String name = field.getName();
        return name.startsWith("$") || name.equals("serialVersionUID");
    }

    public NormColumnInfo a(String str) {
        NormColumnInfo[] normColumnInfoArr;
        for (NormColumnInfo normColumnInfo : this.c) {
            if (normColumnInfo.a.equals(str)) {
                return normColumnInfo;
            }
        }
        return null;
    }

    public String[] a() {
        return this.a;
    }

    public String[] a(int i, int i2) {
        ArrayList arrayList = new ArrayList();
        int i3 = 0;
        for (int i4 = 0; i4 < this.c.length; i4++) {
            if (this.c[i4].i > i) {
                arrayList.add(Integer.valueOf(i4));
            }
        }
        if (arrayList.size() == 0) {
            return new String[0];
        }
        String[] strArr = new String[arrayList.size()];
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            NormColumnInfo normColumnInfo = this.c[((Integer) it.next()).intValue()];
            StringBuilder sb = new StringBuilder();
            sb.append("ALTER TABLE ");
            sb.append(this.d);
            sb.append(" ADD COLUMN ");
            sb.append(normColumnInfo.a);
            sb.append(" ");
            switch (normColumnInfo.c) {
                case INT:
                case LONG:
                case BOOL:
                    if (!normColumnInfo.g) {
                        sb.append("INTEGER");
                        break;
                    } else {
                        sb.append("INTEGER PRIMARY KEY");
                        break;
                    }
                case DOUBLE:
                case FLOAT:
                    sb.append("REAL");
                    break;
                case ENUM:
                case TEXT:
                case JSON:
                    sb.append("TEXT");
                    break;
                case BLOB:
                    sb.append("BLOB");
                    break;
            }
            strArr[i3] = sb.toString();
            sb.reverse();
            i3++;
        }
        return strArr;
    }

    public String[] b() {
        return this.b;
    }

    public String c() {
        return this.d;
    }

    public String[] d() {
        return this.e;
    }

    public NormColumnInfo[] e() {
        return this.c;
    }

    public NormColumnInfo f() {
        return this.f;
    }
}
