package com.google.protobuf;

import com.google.protobuf.Descriptors.FieldDescriptor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class TextFormatParseInfoTree {
    private Map<FieldDescriptor, List<TextFormatParseLocation>> locationsFromField;
    Map<FieldDescriptor, List<TextFormatParseInfoTree>> subtreesFromField;

    public static class Builder {
        private Map<FieldDescriptor, List<TextFormatParseLocation>> locationsFromField;
        private Map<FieldDescriptor, List<Builder>> subtreeBuildersFromField;

        private Builder() {
            this.locationsFromField = new HashMap();
            this.subtreeBuildersFromField = new HashMap();
        }

        public TextFormatParseInfoTree build() {
            return new TextFormatParseInfoTree(this.locationsFromField, this.subtreeBuildersFromField);
        }

        public Builder getBuilderForSubMessageField(FieldDescriptor fieldDescriptor) {
            List list = (List) this.subtreeBuildersFromField.get(fieldDescriptor);
            if (list == null) {
                list = new ArrayList();
                this.subtreeBuildersFromField.put(fieldDescriptor, list);
            }
            Builder builder = new Builder();
            list.add(builder);
            return builder;
        }

        public Builder setLocation(FieldDescriptor fieldDescriptor, TextFormatParseLocation textFormatParseLocation) {
            List list = (List) this.locationsFromField.get(fieldDescriptor);
            if (list == null) {
                list = new ArrayList();
                this.locationsFromField.put(fieldDescriptor, list);
            }
            list.add(textFormatParseLocation);
            return this;
        }
    }

    private TextFormatParseInfoTree(Map<FieldDescriptor, List<TextFormatParseLocation>> map, Map<FieldDescriptor, List<Builder>> map2) {
        HashMap hashMap = new HashMap();
        for (Entry entry : map.entrySet()) {
            hashMap.put(entry.getKey(), Collections.unmodifiableList((List) entry.getValue()));
        }
        this.locationsFromField = Collections.unmodifiableMap(hashMap);
        HashMap hashMap2 = new HashMap();
        for (Entry entry2 : map2.entrySet()) {
            ArrayList arrayList = new ArrayList();
            for (Builder build : (List) entry2.getValue()) {
                arrayList.add(build.build());
            }
            hashMap2.put(entry2.getKey(), Collections.unmodifiableList(arrayList));
        }
        this.subtreesFromField = Collections.unmodifiableMap(hashMap2);
    }

    public static Builder builder() {
        return new Builder();
    }

    private static <T> T getFromList(List<T> list, int i, FieldDescriptor fieldDescriptor) {
        if (i < list.size() && i >= 0) {
            return list.get(i);
        }
        Object[] objArr = new Object[2];
        objArr[0] = fieldDescriptor == null ? "<null>" : fieldDescriptor.getName();
        objArr[1] = Integer.valueOf(i);
        throw new IllegalArgumentException(String.format("Illegal index field: %s, index %d", objArr));
    }

    public TextFormatParseLocation getLocation(FieldDescriptor fieldDescriptor, int i) {
        return (TextFormatParseLocation) getFromList(getLocations(fieldDescriptor), i, fieldDescriptor);
    }

    public List<TextFormatParseLocation> getLocations(FieldDescriptor fieldDescriptor) {
        List<TextFormatParseLocation> list = (List) this.locationsFromField.get(fieldDescriptor);
        return list == null ? Collections.emptyList() : list;
    }

    public TextFormatParseInfoTree getNestedTree(FieldDescriptor fieldDescriptor, int i) {
        return (TextFormatParseInfoTree) getFromList(getNestedTrees(fieldDescriptor), i, fieldDescriptor);
    }

    public List<TextFormatParseInfoTree> getNestedTrees(FieldDescriptor fieldDescriptor) {
        List<TextFormatParseInfoTree> list = (List) this.subtreesFromField.get(fieldDescriptor);
        return list == null ? Collections.emptyList() : list;
    }
}
