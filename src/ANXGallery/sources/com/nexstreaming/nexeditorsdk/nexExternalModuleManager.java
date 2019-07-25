package com.nexstreaming.nexeditorsdk;

import com.nexstreaming.nexeditorsdk.module.UserField;
import com.nexstreaming.nexeditorsdk.module.nexExternalExportProvider;
import com.nexstreaming.nexeditorsdk.module.nexFaceDetectionProvider;
import com.nexstreaming.nexeditorsdk.module.nexModuleProvider;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class nexExternalModuleManager {
    private static final String TAG = "nexModuleManager";
    private static final Class[] s_supportedModuleClass = {nexExternalExportProvider.class, nexFaceDetectionProvider.class};
    private static nexExternalModuleManager single;
    private List<a> moduleInfos = new ArrayList();
    private Map<String, Class<? extends nexModuleProvider>> moduleProviders = new HashMap();

    private final class a implements nexModuleProvider {
        private final String b;
        private final String c;
        private final String d;
        private final String e;
        private final String f;
        private final int g;
        private final UserField[] h;
        /* access modifiers changed from: private */
        public final int i;

        private a(nexModuleProvider nexmoduleprovider, int i2) {
            this.b = nexmoduleprovider.name();
            this.c = nexmoduleprovider.uuid();
            this.d = nexmoduleprovider.description();
            this.e = nexmoduleprovider.auth();
            this.g = nexmoduleprovider.version();
            this.h = nexmoduleprovider.userFields();
            this.f = nexmoduleprovider.format();
            this.i = i2;
        }

        public String auth() {
            return this.e;
        }

        public String description() {
            return this.d;
        }

        public String format() {
            return this.f;
        }

        public String name() {
            return this.b;
        }

        public UserField[] userFields() {
            return this.h;
        }

        public String uuid() {
            return this.c;
        }

        public int version() {
            return this.g;
        }
    }

    private nexExternalModuleManager() {
    }

    static nexExternalModuleManager getInstance() {
        if (single == null) {
            single = new nexExternalModuleManager();
        }
        return single;
    }

    private int getSubClassType(Class<? extends nexModuleProvider> cls) {
        for (int i = 0; i < s_supportedModuleClass.length; i++) {
            if (s_supportedModuleClass[i].isAssignableFrom(cls)) {
                return i + 1;
            }
        }
        return 0;
    }

    private int getSubClassType(Object obj) {
        int i = 0;
        for (int i2 = 0; i2 < s_supportedModuleClass.length; i2++) {
            if (s_supportedModuleClass[i2].isInstance(obj)) {
                i |= i2 + 1;
            }
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public void clearModule() {
        this.moduleInfos.clear();
        this.moduleProviders.clear();
    }

    /* access modifiers changed from: 0000 */
    public Object getModule(String str) {
        Constructor constructor;
        try {
            constructor = ((Class) this.moduleProviders.get(str)).getConstructor(new Class[0]);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
            constructor = null;
        }
        if (constructor != null) {
            try {
                return constructor.newInstance(new Object[0]);
            } catch (InstantiationException e2) {
                e2.printStackTrace();
            } catch (IllegalAccessException e3) {
                e3.printStackTrace();
            } catch (InvocationTargetException e4) {
                e4.printStackTrace();
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public Object getModule(String str, Class<? extends nexModuleProvider> cls) {
        int subClassType = getSubClassType(cls);
        for (a aVar : this.moduleInfos) {
            if (aVar.name().compareTo(str) == 0 && (aVar.i & subClassType) != 0) {
                return getModule(aVar.uuid());
            }
        }
        return null;
    }

    public List<nexModuleProvider> getModules(Class<? extends nexModuleProvider> cls) {
        ArrayList arrayList = new ArrayList();
        int subClassType = getSubClassType(cls);
        for (a aVar : this.moduleInfos) {
            if ((aVar.i & subClassType) != 0) {
                arrayList.add(aVar);
            }
        }
        return arrayList;
    }

    public void registerModule(Class<? extends nexModuleProvider> cls) {
        Constructor constructor;
        try {
            constructor = cls.getConstructor(new Class[0]);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
            constructor = null;
        }
        if (constructor != null) {
            try {
                nexModuleProvider nexmoduleprovider = (nexModuleProvider) constructor.newInstance(new Object[0]);
                for (nexModuleProvider uuid : this.moduleInfos) {
                    if (uuid.uuid().compareTo(nexmoduleprovider.uuid()) == 0) {
                        return;
                    }
                }
                int subClassType = getSubClassType((Object) nexmoduleprovider);
                if (subClassType != 0) {
                    this.moduleInfos.add(new a(nexmoduleprovider, subClassType));
                    this.moduleProviders.put(nexmoduleprovider.uuid(), cls);
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("not supported Provider interface. uuid=");
                    sb.append(nexmoduleprovider.uuid());
                    throw new RuntimeException(sb.toString());
                }
            } catch (InstantiationException e2) {
                e2.printStackTrace();
            } catch (IllegalAccessException e3) {
                e3.printStackTrace();
            } catch (InvocationTargetException e4) {
                e4.printStackTrace();
            }
        }
    }

    public void registerModule(String str) {
        try {
            registerModule(Class.forName(str));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void unregisterModule(nexModuleProvider nexmoduleprovider) {
        unregisterModule(nexmoduleprovider.uuid());
    }

    public void unregisterModule(String str) {
        nexModuleProvider nexmoduleprovider;
        Iterator it = this.moduleInfos.iterator();
        while (true) {
            if (!it.hasNext()) {
                nexmoduleprovider = null;
                break;
            }
            nexmoduleprovider = (nexModuleProvider) it.next();
            if (nexmoduleprovider.uuid().compareTo(str) == 0) {
                break;
            }
        }
        if (nexmoduleprovider != null) {
            this.moduleInfos.remove(nexmoduleprovider);
            this.moduleProviders.remove(str);
        }
    }
}
