package com.google.protobuf;

import com.google.protobuf.GeneratedMessageLite.ExtendableMessage;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeSet;

final class MessageLiteToString {
    private static final String BUILDER_LIST_SUFFIX = "OrBuilderList";
    private static final String BYTES_SUFFIX = "Bytes";
    private static final String LIST_SUFFIX = "List";
    private static final String MAP_SUFFIX = "Map";

    MessageLiteToString() {
    }

    private static final String camelCaseToSnakeCase(String str) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (Character.isUpperCase(charAt)) {
                sb.append("_");
            }
            sb.append(Character.toLowerCase(charAt));
        }
        return sb.toString();
    }

    private static boolean isDefaultValue(Object obj) {
        boolean z = true;
        if (obj instanceof Boolean) {
            return !((Boolean) obj).booleanValue();
        }
        if (obj instanceof Integer) {
            if (((Integer) obj).intValue() != 0) {
                z = false;
            }
            return z;
        } else if (obj instanceof Float) {
            if (((Float) obj).floatValue() != 0.0f) {
                z = false;
            }
            return z;
        } else if (obj instanceof Double) {
            if (((Double) obj).doubleValue() != 0.0d) {
                z = false;
            }
            return z;
        } else if (obj instanceof String) {
            return obj.equals("");
        } else {
            if (obj instanceof ByteString) {
                return obj.equals(ByteString.EMPTY);
            }
            if (obj instanceof MessageLite) {
                if (obj != ((MessageLite) obj).getDefaultInstanceForType()) {
                    z = false;
                }
                return z;
            } else if (!(obj instanceof Enum)) {
                return false;
            } else {
                if (((Enum) obj).ordinal() != 0) {
                    z = false;
                }
                return z;
            }
        }
    }

    static final void printField(StringBuilder sb, int i, String str, Object obj) {
        if (obj instanceof List) {
            for (Object printField : (List) obj) {
                printField(sb, i, str, printField);
            }
        } else if (obj instanceof Map) {
            for (Entry printField2 : ((Map) obj).entrySet()) {
                printField(sb, i, str, printField2);
            }
        } else {
            sb.append(10);
            int i2 = 0;
            for (int i3 = 0; i3 < i; i3++) {
                sb.append(' ');
            }
            sb.append(str);
            if (obj instanceof String) {
                sb.append(": \"");
                sb.append(TextFormatEscaper.escapeText((String) obj));
                sb.append('\"');
            } else if (obj instanceof ByteString) {
                sb.append(": \"");
                sb.append(TextFormatEscaper.escapeBytes((ByteString) obj));
                sb.append('\"');
            } else if (obj instanceof GeneratedMessageLite) {
                sb.append(" {");
                reflectivePrintWithIndent((GeneratedMessageLite) obj, sb, i + 2);
                sb.append("\n");
                while (i2 < i) {
                    sb.append(' ');
                    i2++;
                }
                sb.append("}");
            } else if (obj instanceof Entry) {
                sb.append(" {");
                Entry entry = (Entry) obj;
                int i4 = i + 2;
                printField(sb, i4, "key", entry.getKey());
                printField(sb, i4, "value", entry.getValue());
                sb.append("\n");
                while (i2 < i) {
                    sb.append(' ');
                    i2++;
                }
                sb.append("}");
            } else {
                sb.append(": ");
                sb.append(obj.toString());
            }
        }
    }

    private static void reflectivePrintWithIndent(MessageLite messageLite, StringBuilder sb, int i) {
        Method[] declaredMethods;
        HashMap hashMap = new HashMap();
        HashMap hashMap2 = new HashMap();
        TreeSet<String> treeSet = new TreeSet<>();
        for (Method method : messageLite.getClass().getDeclaredMethods()) {
            hashMap2.put(method.getName(), method);
            if (method.getParameterTypes().length == 0) {
                hashMap.put(method.getName(), method);
                if (method.getName().startsWith("get")) {
                    treeSet.add(method.getName());
                }
            }
        }
        for (String str : treeSet) {
            String replaceFirst = str.replaceFirst("get", "");
            if (replaceFirst.endsWith(LIST_SUFFIX) && !replaceFirst.endsWith(BUILDER_LIST_SUFFIX) && !replaceFirst.equals(LIST_SUFFIX)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(replaceFirst.substring(0, 1).toLowerCase());
                sb2.append(replaceFirst.substring(1, replaceFirst.length() - LIST_SUFFIX.length()));
                String sb3 = sb2.toString();
                Method method2 = (Method) hashMap.get(str);
                if (method2 != null && method2.getReturnType().equals(List.class)) {
                    printField(sb, i, camelCaseToSnakeCase(sb3), GeneratedMessageLite.invokeOrDie(method2, messageLite, new Object[0]));
                }
            }
            if (replaceFirst.endsWith(MAP_SUFFIX) && !replaceFirst.equals(MAP_SUFFIX)) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append(replaceFirst.substring(0, 1).toLowerCase());
                sb4.append(replaceFirst.substring(1, replaceFirst.length() - MAP_SUFFIX.length()));
                String sb5 = sb4.toString();
                Method method3 = (Method) hashMap.get(str);
                if (method3 != null && method3.getReturnType().equals(Map.class) && !method3.isAnnotationPresent(Deprecated.class) && Modifier.isPublic(method3.getModifiers())) {
                    printField(sb, i, camelCaseToSnakeCase(sb5), GeneratedMessageLite.invokeOrDie(method3, messageLite, new Object[0]));
                }
            }
            StringBuilder sb6 = new StringBuilder();
            sb6.append("set");
            sb6.append(replaceFirst);
            if (((Method) hashMap2.get(sb6.toString())) != null) {
                if (replaceFirst.endsWith(BYTES_SUFFIX)) {
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append("get");
                    sb7.append(replaceFirst.substring(0, replaceFirst.length() - BYTES_SUFFIX.length()));
                    if (hashMap.containsKey(sb7.toString())) {
                    }
                }
                StringBuilder sb8 = new StringBuilder();
                sb8.append(replaceFirst.substring(0, 1).toLowerCase());
                sb8.append(replaceFirst.substring(1));
                String sb9 = sb8.toString();
                StringBuilder sb10 = new StringBuilder();
                sb10.append("get");
                sb10.append(replaceFirst);
                Method method4 = (Method) hashMap.get(sb10.toString());
                StringBuilder sb11 = new StringBuilder();
                sb11.append("has");
                sb11.append(replaceFirst);
                Method method5 = (Method) hashMap.get(sb11.toString());
                if (method4 != null) {
                    Object invokeOrDie = GeneratedMessageLite.invokeOrDie(method4, messageLite, new Object[0]);
                    boolean z = method5 == null ? !isDefaultValue(invokeOrDie) : ((Boolean) GeneratedMessageLite.invokeOrDie(method5, messageLite, new Object[0])).booleanValue();
                    if (z) {
                        printField(sb, i, camelCaseToSnakeCase(sb9), invokeOrDie);
                    }
                }
            }
        }
        if (messageLite instanceof ExtendableMessage) {
            Iterator it = ((ExtendableMessage) messageLite).extensions.iterator();
            while (it.hasNext()) {
                Entry entry = (Entry) it.next();
                StringBuilder sb12 = new StringBuilder();
                sb12.append("[");
                sb12.append(((ExtensionDescriptor) entry.getKey()).getNumber());
                sb12.append("]");
                printField(sb, i, sb12.toString(), entry.getValue());
            }
        }
        GeneratedMessageLite generatedMessageLite = (GeneratedMessageLite) messageLite;
        if (generatedMessageLite.unknownFields != null) {
            generatedMessageLite.unknownFields.printWithIndent(sb, i);
        }
    }

    static String toString(MessageLite messageLite, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("# ");
        sb.append(str);
        reflectivePrintWithIndent(messageLite, sb, 0);
        return sb.toString();
    }
}
