package com.google.protobuf;

import com.google.protobuf.Descriptors.EnumDescriptor;
import com.google.protobuf.Descriptors.EnumValueDescriptor;
import com.google.protobuf.Internal.EnumLiteMap;

public enum NullValue implements ProtocolMessageEnum {
    NULL_VALUE(0),
    UNRECOGNIZED(-1);
    
    public static final int NULL_VALUE_VALUE = 0;
    private static final NullValue[] VALUES = null;
    private static final EnumLiteMap<NullValue> internalValueMap = null;
    private final int value;

    static {
        internalValueMap = new EnumLiteMap<NullValue>() {
            public NullValue findValueByNumber(int i) {
                return NullValue.forNumber(i);
            }
        };
        VALUES = values();
    }

    private NullValue(int i) {
        this.value = i;
    }

    public static NullValue forNumber(int i) {
        if (i != 0) {
            return null;
        }
        return NULL_VALUE;
    }

    public static final EnumDescriptor getDescriptor() {
        return (EnumDescriptor) StructProto.getDescriptor().getEnumTypes().get(0);
    }

    public static EnumLiteMap<NullValue> internalGetValueMap() {
        return internalValueMap;
    }

    @Deprecated
    public static NullValue valueOf(int i) {
        return forNumber(i);
    }

    public static NullValue valueOf(EnumValueDescriptor enumValueDescriptor) {
        if (enumValueDescriptor.getType() == getDescriptor()) {
            return enumValueDescriptor.getIndex() == -1 ? UNRECOGNIZED : VALUES[enumValueDescriptor.getIndex()];
        }
        throw new IllegalArgumentException("EnumValueDescriptor is not for this type.");
    }

    public final EnumDescriptor getDescriptorForType() {
        return getDescriptor();
    }

    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.value;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    public final EnumValueDescriptor getValueDescriptor() {
        return (EnumValueDescriptor) getDescriptor().getValues().get(ordinal());
    }
}
