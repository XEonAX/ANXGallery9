package com.google.protobuf;

import com.google.protobuf.Descriptors.Descriptor;
import com.google.protobuf.Descriptors.EnumDescriptor;
import com.google.protobuf.Descriptors.EnumValueDescriptor;
import com.google.protobuf.Descriptors.FieldDescriptor;
import com.google.protobuf.Descriptors.FieldDescriptor.JavaType;
import com.google.protobuf.Descriptors.FieldDescriptor.Type;
import com.google.protobuf.Descriptors.OneofDescriptor;
import com.google.protobuf.ExtensionRegistry.ExtensionInfo;
import com.google.protobuf.Message.Builder;
import com.google.protobuf.UnknownFieldSet.Field;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.movie.utils.MovieStatUtils;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class TextFormat {
    private static final Parser PARSER = Parser.newBuilder().build();
    /* access modifiers changed from: private */
    public static final Logger logger = Logger.getLogger(TextFormat.class.getName());

    public static class InvalidEscapeSequenceException extends IOException {
        private static final long serialVersionUID = -8164033650142593304L;

        InvalidEscapeSequenceException(String str) {
            super(str);
        }
    }

    public static class ParseException extends IOException {
        private static final long serialVersionUID = 3196188060225107702L;
        private final int column;
        private final int line;

        public ParseException(int i, int i2, String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toString(i));
            sb.append(":");
            sb.append(i2);
            sb.append(": ");
            sb.append(str);
            super(sb.toString());
            this.line = i;
            this.column = i2;
        }

        public ParseException(String str) {
            this(-1, -1, str);
        }

        public int getColumn() {
            return this.column;
        }

        public int getLine() {
            return this.line;
        }
    }

    public static class Parser {
        private static final int BUFFER_SIZE = 4096;
        private final boolean allowUnknownEnumValues;
        private final boolean allowUnknownExtensions;
        private final boolean allowUnknownFields;
        private com.google.protobuf.TextFormatParseInfoTree.Builder parseInfoTreeBuilder;
        private final SingularOverwritePolicy singularOverwritePolicy;

        public static class Builder {
            private boolean allowUnknownEnumValues = false;
            private boolean allowUnknownExtensions = false;
            private boolean allowUnknownFields = false;
            private com.google.protobuf.TextFormatParseInfoTree.Builder parseInfoTreeBuilder = null;
            private SingularOverwritePolicy singularOverwritePolicy = SingularOverwritePolicy.ALLOW_SINGULAR_OVERWRITES;

            public Parser build() {
                Parser parser = new Parser(this.allowUnknownFields, this.allowUnknownEnumValues, this.allowUnknownExtensions, this.singularOverwritePolicy, this.parseInfoTreeBuilder);
                return parser;
            }

            public Builder setAllowUnknownExtensions(boolean z) {
                this.allowUnknownExtensions = z;
                return this;
            }

            public Builder setParseInfoTreeBuilder(com.google.protobuf.TextFormatParseInfoTree.Builder builder) {
                this.parseInfoTreeBuilder = builder;
                return this;
            }

            public Builder setSingularOverwritePolicy(SingularOverwritePolicy singularOverwritePolicy2) {
                this.singularOverwritePolicy = singularOverwritePolicy2;
                return this;
            }
        }

        public enum SingularOverwritePolicy {
            ALLOW_SINGULAR_OVERWRITES,
            FORBID_SINGULAR_OVERWRITES
        }

        static final class UnknownField {
            final String message;
            final Type type;

            enum Type {
                FIELD,
                EXTENSION
            }

            UnknownField(String str, Type type2) {
                this.message = str;
                this.type = type2;
            }
        }

        private Parser(boolean z, boolean z2, boolean z3, SingularOverwritePolicy singularOverwritePolicy2, com.google.protobuf.TextFormatParseInfoTree.Builder builder) {
            this.allowUnknownFields = z;
            this.allowUnknownEnumValues = z2;
            this.allowUnknownExtensions = z3;
            this.singularOverwritePolicy = singularOverwritePolicy2;
            this.parseInfoTreeBuilder = builder;
        }

        private void checkUnknownFields(List<UnknownField> list) throws ParseException {
            int i;
            boolean z;
            if (!list.isEmpty()) {
                StringBuilder sb = new StringBuilder("Input contains unknown fields and/or extensions:");
                for (UnknownField unknownField : list) {
                    sb.append(10);
                    sb.append(unknownField.message);
                }
                if (this.allowUnknownFields) {
                    TextFormat.logger.warning(sb.toString());
                    return;
                }
                if (this.allowUnknownExtensions) {
                    Iterator it = list.iterator();
                    i = 0;
                    while (true) {
                        if (!it.hasNext()) {
                            z = true;
                            break;
                        } else if (((UnknownField) it.next()).type == Type.FIELD) {
                            z = false;
                            break;
                        } else {
                            i++;
                        }
                    }
                    if (z) {
                        TextFormat.logger.warning(sb.toString());
                        return;
                    }
                } else {
                    i = 0;
                }
                String[] split = ((UnknownField) list.get(i)).message.split(":");
                throw new ParseException(Integer.parseInt(split[0]), Integer.parseInt(split[1]), sb.toString());
            }
        }

        /* JADX WARNING: type inference failed for: r3v0 */
        /* JADX WARNING: type inference failed for: r3v1, types: [java.lang.Object] */
        /* JADX WARNING: type inference failed for: r3v2, types: [java.lang.Integer] */
        /* JADX WARNING: type inference failed for: r3v3, types: [java.lang.Long] */
        /* JADX WARNING: type inference failed for: r3v4, types: [java.lang.Boolean] */
        /* JADX WARNING: type inference failed for: r3v5, types: [java.lang.Float] */
        /* JADX WARNING: type inference failed for: r3v6, types: [java.lang.Double] */
        /* JADX WARNING: type inference failed for: r3v7, types: [java.lang.Integer] */
        /* JADX WARNING: type inference failed for: r3v8, types: [java.lang.Long] */
        /* JADX WARNING: type inference failed for: r3v9, types: [java.lang.String] */
        /* JADX WARNING: type inference failed for: r3v10, types: [com.google.protobuf.ByteString] */
        /* JADX WARNING: type inference failed for: r3v11, types: [com.google.protobuf.Descriptors$EnumValueDescriptor] */
        /* JADX WARNING: type inference failed for: r3v13, types: [com.google.protobuf.Descriptors$EnumValueDescriptor] */
        /* JADX WARNING: type inference failed for: r3v18, types: [com.google.protobuf.Message] */
        /* JADX WARNING: type inference failed for: r3v19, types: [java.lang.Object] */
        /* JADX WARNING: type inference failed for: r3v21, types: [com.google.protobuf.Message] */
        /* JADX WARNING: type inference failed for: r3v22 */
        /* JADX WARNING: type inference failed for: r3v23 */
        /* JADX WARNING: type inference failed for: r3v24 */
        /* JADX WARNING: type inference failed for: r3v25 */
        /* JADX WARNING: type inference failed for: r3v26 */
        /* JADX WARNING: type inference failed for: r3v27 */
        /* JADX WARNING: type inference failed for: r3v28 */
        /* JADX WARNING: type inference failed for: r3v29 */
        /* JADX WARNING: type inference failed for: r3v30 */
        /* JADX WARNING: type inference failed for: r3v31 */
        /* JADX WARNING: type inference failed for: r3v32 */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v0
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], com.google.protobuf.Descriptors$EnumValueDescriptor, com.google.protobuf.Message, java.lang.Integer, java.lang.Long, java.lang.Boolean, java.lang.Float, java.lang.Double, java.lang.String, com.google.protobuf.ByteString, java.lang.Object]
  uses: [java.lang.Object, ?[int, boolean, OBJECT, ARRAY, byte, short, char], com.google.protobuf.Message]
  mth insns count: 177
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 12 */
        private void consumeFieldValue(Tokenizer tokenizer, ExtensionRegistry extensionRegistry, MergeTarget mergeTarget, FieldDescriptor fieldDescriptor, ExtensionInfo extensionInfo, com.google.protobuf.TextFormatParseInfoTree.Builder builder, List<UnknownField> list) throws ParseException {
            String str;
            Tokenizer tokenizer2 = tokenizer;
            MergeTarget mergeTarget2 = mergeTarget;
            FieldDescriptor fieldDescriptor2 = fieldDescriptor;
            ExtensionInfo extensionInfo2 = extensionInfo;
            if (this.singularOverwritePolicy == SingularOverwritePolicy.FORBID_SINGULAR_OVERWRITES && !fieldDescriptor.isRepeated()) {
                if (mergeTarget.hasField(fieldDescriptor)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Non-repeated field \"");
                    sb.append(fieldDescriptor.getFullName());
                    sb.append("\" cannot be overwritten.");
                    throw tokenizer.parseExceptionPreviousToken(sb.toString());
                } else if (fieldDescriptor.getContainingOneof() != null && mergeTarget.hasOneof(fieldDescriptor.getContainingOneof())) {
                    OneofDescriptor containingOneof = fieldDescriptor.getContainingOneof();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Field \"");
                    sb2.append(fieldDescriptor.getFullName());
                    sb2.append("\" is specified along with field \"");
                    sb2.append(mergeTarget.getOneofFieldDescriptor(containingOneof).getFullName());
                    sb2.append("\", another member of oneof \"");
                    sb2.append(containingOneof.getName());
                    sb2.append("\".");
                    throw tokenizer.parseExceptionPreviousToken(sb2.toString());
                }
            }
            ? r3 = 0;
            if (fieldDescriptor.getJavaType() == JavaType.MESSAGE) {
                if (tokenizer.tryConsume("<")) {
                    str = ">";
                } else {
                    tokenizer.consume("{");
                    str = "}";
                }
                String str2 = str;
                if (extensionInfo2 != null) {
                    r3 = extensionInfo2.defaultInstance;
                }
                MergeTarget newMergeTargetForField = mergeTarget.newMergeTargetForField(fieldDescriptor2, r3);
                while (!tokenizer.tryConsume(str2)) {
                    if (!tokenizer.atEnd()) {
                        mergeField(tokenizer, extensionRegistry, newMergeTargetForField, builder, list);
                    } else {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Expected \"");
                        sb3.append(str2);
                        sb3.append("\".");
                        throw tokenizer.parseException(sb3.toString());
                    }
                }
                r3 = newMergeTargetForField.finish();
            } else {
                switch (fieldDescriptor.getType()) {
                    case INT32:
                    case SINT32:
                    case SFIXED32:
                        r3 = Integer.valueOf(tokenizer.consumeInt32());
                        break;
                    case INT64:
                    case SINT64:
                    case SFIXED64:
                        r3 = Long.valueOf(tokenizer.consumeInt64());
                        break;
                    case BOOL:
                        r3 = Boolean.valueOf(tokenizer.consumeBoolean());
                        break;
                    case FLOAT:
                        r3 = Float.valueOf(tokenizer.consumeFloat());
                        break;
                    case DOUBLE:
                        r3 = Double.valueOf(tokenizer.consumeDouble());
                        break;
                    case UINT32:
                    case FIXED32:
                        r3 = Integer.valueOf(tokenizer.consumeUInt32());
                        break;
                    case UINT64:
                    case FIXED64:
                        r3 = Long.valueOf(tokenizer.consumeUInt64());
                        break;
                    case STRING:
                        r3 = tokenizer.consumeString();
                        break;
                    case BYTES:
                        r3 = tokenizer.consumeByteString();
                        break;
                    case ENUM:
                        EnumDescriptor enumType = fieldDescriptor.getEnumType();
                        if (tokenizer.lookingAtInteger()) {
                            int consumeInt32 = tokenizer.consumeInt32();
                            r3 = enumType.findValueByNumber(consumeInt32);
                            if (r3 == 0) {
                                StringBuilder sb4 = new StringBuilder();
                                sb4.append("Enum type \"");
                                sb4.append(enumType.getFullName());
                                sb4.append("\" has no value with number ");
                                sb4.append(consumeInt32);
                                sb4.append('.');
                                String sb5 = sb4.toString();
                                if (this.allowUnknownEnumValues) {
                                    TextFormat.logger.warning(sb5);
                                    return;
                                }
                                StringBuilder sb6 = new StringBuilder();
                                sb6.append("Enum type \"");
                                sb6.append(enumType.getFullName());
                                sb6.append("\" has no value with number ");
                                sb6.append(consumeInt32);
                                sb6.append('.');
                                throw tokenizer.parseExceptionPreviousToken(sb6.toString());
                            }
                        } else {
                            String consumeIdentifier = tokenizer.consumeIdentifier();
                            r3 = enumType.findValueByName(consumeIdentifier);
                            if (r3 == 0) {
                                StringBuilder sb7 = new StringBuilder();
                                sb7.append("Enum type \"");
                                sb7.append(enumType.getFullName());
                                sb7.append("\" has no value named \"");
                                sb7.append(consumeIdentifier);
                                sb7.append("\".");
                                String sb8 = sb7.toString();
                                if (this.allowUnknownEnumValues) {
                                    TextFormat.logger.warning(sb8);
                                    return;
                                }
                                throw tokenizer.parseExceptionPreviousToken(sb8);
                            }
                        }
                        break;
                    case MESSAGE:
                    case GROUP:
                        throw new RuntimeException("Can't get here.");
                }
            }
            if (fieldDescriptor.isRepeated()) {
                mergeTarget.addRepeatedField(fieldDescriptor2, r3);
            } else {
                mergeTarget.setField(fieldDescriptor2, r3);
            }
        }

        private void consumeFieldValues(Tokenizer tokenizer, ExtensionRegistry extensionRegistry, MergeTarget mergeTarget, FieldDescriptor fieldDescriptor, ExtensionInfo extensionInfo, com.google.protobuf.TextFormatParseInfoTree.Builder builder, List<UnknownField> list) throws ParseException {
            if (!fieldDescriptor.isRepeated() || !tokenizer.tryConsume("[")) {
                consumeFieldValue(tokenizer, extensionRegistry, mergeTarget, fieldDescriptor, extensionInfo, builder, list);
            } else if (!tokenizer.tryConsume("]")) {
                while (true) {
                    consumeFieldValue(tokenizer, extensionRegistry, mergeTarget, fieldDescriptor, extensionInfo, builder, list);
                    if (!tokenizer.tryConsume("]")) {
                        tokenizer.consume(",");
                    } else {
                        return;
                    }
                }
            }
        }

        private void mergeField(Tokenizer tokenizer, ExtensionRegistry extensionRegistry, MergeTarget mergeTarget, com.google.protobuf.TextFormatParseInfoTree.Builder builder, List<UnknownField> list) throws ParseException {
            FieldDescriptor fieldDescriptor;
            ExtensionInfo extensionInfo;
            Tokenizer tokenizer2 = tokenizer;
            com.google.protobuf.TextFormatParseInfoTree.Builder builder2 = builder;
            List<UnknownField> list2 = list;
            int line = tokenizer.getLine();
            int column = tokenizer.getColumn();
            Descriptor descriptorForType = mergeTarget.getDescriptorForType();
            FieldDescriptor fieldDescriptor2 = null;
            if (tokenizer.tryConsume("[")) {
                StringBuilder sb = new StringBuilder(tokenizer.consumeIdentifier());
                while (tokenizer.tryConsume(".")) {
                    sb.append('.');
                    sb.append(tokenizer.consumeIdentifier());
                }
                MergeTarget mergeTarget2 = mergeTarget;
                ExtensionInfo findExtensionByName = mergeTarget2.findExtensionByName(extensionRegistry, sb.toString());
                if (findExtensionByName == null) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(tokenizer.getPreviousLine() + 1);
                    sb2.append(":");
                    sb2.append(tokenizer.getPreviousColumn() + 1);
                    sb2.append(":\t");
                    sb2.append(descriptorForType.getFullName());
                    sb2.append(".[");
                    sb2.append(sb);
                    sb2.append("]");
                    list2.add(new UnknownField(sb2.toString(), Type.EXTENSION));
                } else if (findExtensionByName.descriptor.getContainingType() == descriptorForType) {
                    fieldDescriptor2 = findExtensionByName.descriptor;
                } else {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Extension \"");
                    sb3.append(sb);
                    sb3.append("\" does not extend message type \"");
                    sb3.append(descriptorForType.getFullName());
                    sb3.append("\".");
                    throw tokenizer.parseExceptionPreviousToken(sb3.toString());
                }
                tokenizer.consume("]");
                fieldDescriptor = fieldDescriptor2;
                extensionInfo = findExtensionByName;
            } else {
                ExtensionRegistry extensionRegistry2 = extensionRegistry;
                MergeTarget mergeTarget3 = mergeTarget;
                String consumeIdentifier = tokenizer.consumeIdentifier();
                FieldDescriptor findFieldByName = descriptorForType.findFieldByName(consumeIdentifier);
                if (findFieldByName == null) {
                    findFieldByName = descriptorForType.findFieldByName(consumeIdentifier.toLowerCase(Locale.US));
                    if (!(findFieldByName == null || findFieldByName.getType() == Type.GROUP)) {
                        findFieldByName = null;
                    }
                }
                if (findFieldByName != null && findFieldByName.getType() == Type.GROUP && !findFieldByName.getMessageType().getName().equals(consumeIdentifier)) {
                    findFieldByName = null;
                }
                if (findFieldByName == null) {
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append(tokenizer.getPreviousLine() + 1);
                    sb4.append(":");
                    sb4.append(tokenizer.getPreviousColumn() + 1);
                    sb4.append(":\t");
                    sb4.append(descriptorForType.getFullName());
                    sb4.append(".");
                    sb4.append(consumeIdentifier);
                    list2.add(new UnknownField(sb4.toString(), Type.FIELD));
                }
                extensionInfo = null;
                fieldDescriptor = findFieldByName;
            }
            if (fieldDescriptor == null) {
                if (!tokenizer.tryConsume(":") || tokenizer.lookingAt("{") || tokenizer.lookingAt("<")) {
                    skipFieldMessage(tokenizer);
                } else {
                    skipFieldValue(tokenizer);
                }
                return;
            }
            if (fieldDescriptor.getJavaType() == JavaType.MESSAGE) {
                tokenizer.tryConsume(":");
                if (builder2 != null) {
                    consumeFieldValues(tokenizer, extensionRegistry, mergeTarget, fieldDescriptor, extensionInfo, builder2.getBuilderForSubMessageField(fieldDescriptor), list);
                } else {
                    consumeFieldValues(tokenizer, extensionRegistry, mergeTarget, fieldDescriptor, extensionInfo, builder, list);
                }
            } else {
                tokenizer.consume(":");
                consumeFieldValues(tokenizer, extensionRegistry, mergeTarget, fieldDescriptor, extensionInfo, builder, list);
            }
            if (builder2 != null) {
                builder2.setLocation(fieldDescriptor, TextFormatParseLocation.create(line, column));
            }
            if (!tokenizer.tryConsume(";")) {
                tokenizer.tryConsume(",");
            }
        }

        private void mergeField(Tokenizer tokenizer, ExtensionRegistry extensionRegistry, MergeTarget mergeTarget, List<UnknownField> list) throws ParseException {
            mergeField(tokenizer, extensionRegistry, mergeTarget, this.parseInfoTreeBuilder, list);
        }

        public static Builder newBuilder() {
            return new Builder();
        }

        private void skipField(Tokenizer tokenizer) throws ParseException {
            if (tokenizer.tryConsume("[")) {
                do {
                    tokenizer.consumeIdentifier();
                } while (tokenizer.tryConsume("."));
                tokenizer.consume("]");
            } else {
                tokenizer.consumeIdentifier();
            }
            if (!tokenizer.tryConsume(":") || tokenizer.lookingAt("<") || tokenizer.lookingAt("{")) {
                skipFieldMessage(tokenizer);
            } else {
                skipFieldValue(tokenizer);
            }
            if (!tokenizer.tryConsume(";")) {
                tokenizer.tryConsume(",");
            }
        }

        private void skipFieldMessage(Tokenizer tokenizer) throws ParseException {
            String str;
            if (tokenizer.tryConsume("<")) {
                str = ">";
            } else {
                tokenizer.consume("{");
                str = "}";
            }
            while (!tokenizer.lookingAt(">") && !tokenizer.lookingAt("}")) {
                skipField(tokenizer);
            }
            tokenizer.consume(str);
        }

        private void skipFieldValue(Tokenizer tokenizer) throws ParseException {
            if (tokenizer.tryConsumeString()) {
                do {
                } while (tokenizer.tryConsumeString());
            } else if (!tokenizer.tryConsumeIdentifier() && !tokenizer.tryConsumeInt64() && !tokenizer.tryConsumeUInt64() && !tokenizer.tryConsumeDouble() && !tokenizer.tryConsumeFloat()) {
                StringBuilder sb = new StringBuilder();
                sb.append("Invalid field value: ");
                sb.append(tokenizer.currentToken);
                throw tokenizer.parseException(sb.toString());
            }
        }

        private static StringBuilder toStringBuilder(Readable readable) throws IOException {
            StringBuilder sb = new StringBuilder();
            CharBuffer allocate = CharBuffer.allocate(4096);
            while (true) {
                int read = readable.read(allocate);
                if (read == -1) {
                    return sb;
                }
                allocate.flip();
                sb.append(allocate, 0, read);
            }
        }

        public void merge(CharSequence charSequence, ExtensionRegistry extensionRegistry, com.google.protobuf.Message.Builder builder) throws ParseException {
            Tokenizer tokenizer = new Tokenizer(charSequence);
            BuilderAdapter builderAdapter = new BuilderAdapter(builder);
            ArrayList arrayList = new ArrayList();
            while (!tokenizer.atEnd()) {
                mergeField(tokenizer, extensionRegistry, builderAdapter, arrayList);
            }
            checkUnknownFields(arrayList);
        }

        public void merge(CharSequence charSequence, com.google.protobuf.Message.Builder builder) throws ParseException {
            merge(charSequence, ExtensionRegistry.getEmptyRegistry(), builder);
        }

        public void merge(Readable readable, ExtensionRegistry extensionRegistry, com.google.protobuf.Message.Builder builder) throws IOException {
            merge((CharSequence) toStringBuilder(readable), extensionRegistry, builder);
        }

        public void merge(Readable readable, com.google.protobuf.Message.Builder builder) throws IOException {
            merge(readable, ExtensionRegistry.getEmptyRegistry(), builder);
        }
    }

    private static final class Printer {
        static final Printer DEFAULT = new Printer(true);
        static final Printer UNICODE = new Printer(false);
        private final boolean escapeNonAscii;

        private Printer(boolean z) {
            this.escapeNonAscii = z;
        }

        /* access modifiers changed from: private */
        public void print(MessageOrBuilder messageOrBuilder, TextGenerator textGenerator) throws IOException {
            for (Entry entry : messageOrBuilder.getAllFields().entrySet()) {
                printField((FieldDescriptor) entry.getKey(), entry.getValue(), textGenerator);
            }
            printUnknownFields(messageOrBuilder.getUnknownFields(), textGenerator);
        }

        /* access modifiers changed from: private */
        public void printField(FieldDescriptor fieldDescriptor, Object obj, TextGenerator textGenerator) throws IOException {
            if (fieldDescriptor.isRepeated()) {
                for (Object printSingleField : (List) obj) {
                    printSingleField(fieldDescriptor, printSingleField, textGenerator);
                }
                return;
            }
            printSingleField(fieldDescriptor, obj, textGenerator);
        }

        /* access modifiers changed from: private */
        public void printFieldValue(FieldDescriptor fieldDescriptor, Object obj, TextGenerator textGenerator) throws IOException {
            switch (fieldDescriptor.getType()) {
                case INT32:
                case SINT32:
                case SFIXED32:
                    textGenerator.print(((Integer) obj).toString());
                    return;
                case INT64:
                case SINT64:
                case SFIXED64:
                    textGenerator.print(((Long) obj).toString());
                    return;
                case BOOL:
                    textGenerator.print(((Boolean) obj).toString());
                    return;
                case FLOAT:
                    textGenerator.print(((Float) obj).toString());
                    return;
                case DOUBLE:
                    textGenerator.print(((Double) obj).toString());
                    return;
                case UINT32:
                case FIXED32:
                    textGenerator.print(TextFormat.unsignedToString(((Integer) obj).intValue()));
                    return;
                case UINT64:
                case FIXED64:
                    textGenerator.print(TextFormat.unsignedToString(((Long) obj).longValue()));
                    return;
                case STRING:
                    textGenerator.print("\"");
                    textGenerator.print(this.escapeNonAscii ? TextFormatEscaper.escapeText((String) obj) : TextFormat.escapeDoubleQuotesAndBackslashes((String) obj).replace("\n", "\\n"));
                    textGenerator.print("\"");
                    return;
                case BYTES:
                    textGenerator.print("\"");
                    if (obj instanceof ByteString) {
                        textGenerator.print(TextFormat.escapeBytes((ByteString) obj));
                    } else {
                        textGenerator.print(TextFormat.escapeBytes((byte[]) obj));
                    }
                    textGenerator.print("\"");
                    return;
                case ENUM:
                    textGenerator.print(((EnumValueDescriptor) obj).getName());
                    return;
                case MESSAGE:
                case GROUP:
                    print((Message) obj, textGenerator);
                    return;
                default:
                    return;
            }
        }

        private void printSingleField(FieldDescriptor fieldDescriptor, Object obj, TextGenerator textGenerator) throws IOException {
            if (fieldDescriptor.isExtension()) {
                textGenerator.print("[");
                if (!fieldDescriptor.getContainingType().getOptions().getMessageSetWireFormat() || fieldDescriptor.getType() != Type.MESSAGE || !fieldDescriptor.isOptional() || fieldDescriptor.getExtensionScope() != fieldDescriptor.getMessageType()) {
                    textGenerator.print(fieldDescriptor.getFullName());
                } else {
                    textGenerator.print(fieldDescriptor.getMessageType().getFullName());
                }
                textGenerator.print("]");
            } else if (fieldDescriptor.getType() == Type.GROUP) {
                textGenerator.print(fieldDescriptor.getMessageType().getName());
            } else {
                textGenerator.print(fieldDescriptor.getName());
            }
            if (fieldDescriptor.getJavaType() == JavaType.MESSAGE) {
                textGenerator.print(" {");
                textGenerator.eol();
                textGenerator.indent();
            } else {
                textGenerator.print(": ");
            }
            printFieldValue(fieldDescriptor, obj, textGenerator);
            if (fieldDescriptor.getJavaType() == JavaType.MESSAGE) {
                textGenerator.outdent();
                textGenerator.print("}");
            }
            textGenerator.eol();
        }

        private void printUnknownField(int i, int i2, List<?> list, TextGenerator textGenerator) throws IOException {
            for (Object next : list) {
                textGenerator.print(String.valueOf(i));
                textGenerator.print(": ");
                TextFormat.printUnknownFieldValue(i2, next, textGenerator);
                textGenerator.eol();
            }
        }

        /* access modifiers changed from: private */
        public void printUnknownFields(UnknownFieldSet unknownFieldSet, TextGenerator textGenerator) throws IOException {
            for (Entry entry : unknownFieldSet.asMap().entrySet()) {
                int intValue = ((Integer) entry.getKey()).intValue();
                Field field = (Field) entry.getValue();
                printUnknownField(intValue, 0, field.getVarintList(), textGenerator);
                printUnknownField(intValue, 5, field.getFixed32List(), textGenerator);
                printUnknownField(intValue, 1, field.getFixed64List(), textGenerator);
                printUnknownField(intValue, 2, field.getLengthDelimitedList(), textGenerator);
                for (UnknownFieldSet unknownFieldSet2 : field.getGroupList()) {
                    textGenerator.print(((Integer) entry.getKey()).toString());
                    textGenerator.print(" {");
                    textGenerator.eol();
                    textGenerator.indent();
                    printUnknownFields(unknownFieldSet2, textGenerator);
                    textGenerator.outdent();
                    textGenerator.print("}");
                    textGenerator.eol();
                }
            }
        }
    }

    private static final class TextGenerator {
        private boolean atStartOfLine;
        private final StringBuilder indent;
        private final Appendable output;
        private final boolean singleLineMode;

        private TextGenerator(Appendable appendable, boolean z) {
            this.indent = new StringBuilder();
            this.atStartOfLine = false;
            this.output = appendable;
            this.singleLineMode = z;
        }

        public void eol() throws IOException {
            if (!this.singleLineMode) {
                this.output.append("\n");
            }
            this.atStartOfLine = true;
        }

        public void indent() {
            this.indent.append("  ");
        }

        public void outdent() {
            int length = this.indent.length();
            if (length != 0) {
                this.indent.setLength(length - 2);
                return;
            }
            throw new IllegalArgumentException(" Outdent() without matching Indent().");
        }

        public void print(CharSequence charSequence) throws IOException {
            if (this.atStartOfLine) {
                this.atStartOfLine = false;
                this.output.append(this.singleLineMode ? " " : this.indent);
            }
            this.output.append(charSequence);
        }
    }

    private static final class Tokenizer {
        private static final Pattern DOUBLE_INFINITY = Pattern.compile("-?inf(inity)?", 2);
        private static final Pattern FLOAT_INFINITY = Pattern.compile("-?inf(inity)?f?", 2);
        private static final Pattern FLOAT_NAN = Pattern.compile("nanf?", 2);
        private static final Pattern TOKEN = Pattern.compile("[a-zA-Z_][0-9a-zA-Z_+-]*+|[.]?[0-9+-][0-9a-zA-Z_.+-]*+|\"([^\"\n\\\\]|\\\\.)*+(\"|\\\\?$)|'([^'\n\\\\]|\\\\.)*+('|\\\\?$)", 8);
        private static final Pattern WHITESPACE = Pattern.compile("(\\s|(#.*$))++", 8);
        private int column;
        /* access modifiers changed from: private */
        public String currentToken;
        private int line;
        private final Matcher matcher;
        private int pos;
        private int previousColumn;
        private int previousLine;
        private final CharSequence text;

        private Tokenizer(CharSequence charSequence) {
            this.pos = 0;
            this.line = 0;
            this.column = 0;
            this.previousLine = 0;
            this.previousColumn = 0;
            this.text = charSequence;
            this.matcher = WHITESPACE.matcher(charSequence);
            skipWhitespace();
            nextToken();
        }

        private void consumeByteString(List<ByteString> list) throws ParseException {
            char c = 0;
            if (this.currentToken.length() > 0) {
                c = this.currentToken.charAt(0);
            }
            if (c != '\"' && c != '\'') {
                throw parseException("Expected string.");
            } else if (this.currentToken.length() < 2 || this.currentToken.charAt(this.currentToken.length() - 1) != c) {
                throw parseException("String missing ending quote.");
            } else {
                try {
                    ByteString unescapeBytes = TextFormat.unescapeBytes(this.currentToken.substring(1, this.currentToken.length() - 1));
                    nextToken();
                    list.add(unescapeBytes);
                } catch (InvalidEscapeSequenceException e) {
                    throw parseException(e.getMessage());
                }
            }
        }

        private ParseException floatParseException(NumberFormatException numberFormatException) {
            StringBuilder sb = new StringBuilder();
            sb.append("Couldn't parse number: ");
            sb.append(numberFormatException.getMessage());
            return parseException(sb.toString());
        }

        private ParseException integerParseException(NumberFormatException numberFormatException) {
            StringBuilder sb = new StringBuilder();
            sb.append("Couldn't parse integer: ");
            sb.append(numberFormatException.getMessage());
            return parseException(sb.toString());
        }

        private void skipWhitespace() {
            this.matcher.usePattern(WHITESPACE);
            if (this.matcher.lookingAt()) {
                this.matcher.region(this.matcher.end(), this.matcher.regionEnd());
            }
        }

        public boolean atEnd() {
            return this.currentToken.length() == 0;
        }

        public void consume(String str) throws ParseException {
            if (!tryConsume(str)) {
                StringBuilder sb = new StringBuilder();
                sb.append("Expected \"");
                sb.append(str);
                sb.append("\".");
                throw parseException(sb.toString());
            }
        }

        public boolean consumeBoolean() throws ParseException {
            if (this.currentToken.equals("true") || this.currentToken.equals("True") || this.currentToken.equals("t") || this.currentToken.equals("1")) {
                nextToken();
                return true;
            } else if (this.currentToken.equals("false") || this.currentToken.equals("False") || this.currentToken.equals("f") || this.currentToken.equals(MovieStatUtils.DOWNLOAD_SUCCESS)) {
                nextToken();
                return false;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Expected \"true\" or \"false\". Found \"");
                sb.append(this.currentToken);
                sb.append("\".");
                throw parseException(sb.toString());
            }
        }

        public ByteString consumeByteString() throws ParseException {
            ArrayList arrayList = new ArrayList();
            consumeByteString(arrayList);
            while (true) {
                if (!this.currentToken.startsWith("'") && !this.currentToken.startsWith("\"")) {
                    return ByteString.copyFrom((Iterable<ByteString>) arrayList);
                }
                consumeByteString(arrayList);
            }
        }

        public double consumeDouble() throws ParseException {
            if (DOUBLE_INFINITY.matcher(this.currentToken).matches()) {
                boolean startsWith = this.currentToken.startsWith("-");
                nextToken();
                return startsWith ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY;
            } else if (this.currentToken.equalsIgnoreCase("nan")) {
                nextToken();
                return Double.NaN;
            } else {
                try {
                    double parseDouble = Double.parseDouble(this.currentToken);
                    nextToken();
                    return parseDouble;
                } catch (NumberFormatException e) {
                    throw floatParseException(e);
                }
            }
        }

        public float consumeFloat() throws ParseException {
            if (FLOAT_INFINITY.matcher(this.currentToken).matches()) {
                boolean startsWith = this.currentToken.startsWith("-");
                nextToken();
                return startsWith ? Float.NEGATIVE_INFINITY : Float.POSITIVE_INFINITY;
            } else if (FLOAT_NAN.matcher(this.currentToken).matches()) {
                nextToken();
                return Float.NaN;
            } else {
                try {
                    float parseFloat = Float.parseFloat(this.currentToken);
                    nextToken();
                    return parseFloat;
                } catch (NumberFormatException e) {
                    throw floatParseException(e);
                }
            }
        }

        public String consumeIdentifier() throws ParseException {
            for (int i = 0; i < this.currentToken.length(); i++) {
                char charAt = this.currentToken.charAt(i);
                if (('a' > charAt || charAt > 'z') && (('A' > charAt || charAt > 'Z') && !(('0' <= charAt && charAt <= '9') || charAt == '_' || charAt == '.'))) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Expected identifier. Found '");
                    sb.append(this.currentToken);
                    sb.append("'");
                    throw parseException(sb.toString());
                }
            }
            String str = this.currentToken;
            nextToken();
            return str;
        }

        public int consumeInt32() throws ParseException {
            try {
                int parseInt32 = TextFormat.parseInt32(this.currentToken);
                nextToken();
                return parseInt32;
            } catch (NumberFormatException e) {
                throw integerParseException(e);
            }
        }

        public long consumeInt64() throws ParseException {
            try {
                long parseInt64 = TextFormat.parseInt64(this.currentToken);
                nextToken();
                return parseInt64;
            } catch (NumberFormatException e) {
                throw integerParseException(e);
            }
        }

        public String consumeString() throws ParseException {
            return consumeByteString().toStringUtf8();
        }

        public int consumeUInt32() throws ParseException {
            try {
                int parseUInt32 = TextFormat.parseUInt32(this.currentToken);
                nextToken();
                return parseUInt32;
            } catch (NumberFormatException e) {
                throw integerParseException(e);
            }
        }

        public long consumeUInt64() throws ParseException {
            try {
                long parseUInt64 = TextFormat.parseUInt64(this.currentToken);
                nextToken();
                return parseUInt64;
            } catch (NumberFormatException e) {
                throw integerParseException(e);
            }
        }

        /* access modifiers changed from: 0000 */
        public int getColumn() {
            return this.column;
        }

        /* access modifiers changed from: 0000 */
        public int getLine() {
            return this.line;
        }

        /* access modifiers changed from: 0000 */
        public int getPreviousColumn() {
            return this.previousColumn;
        }

        /* access modifiers changed from: 0000 */
        public int getPreviousLine() {
            return this.previousLine;
        }

        public boolean lookingAt(String str) {
            return this.currentToken.equals(str);
        }

        public boolean lookingAtInteger() {
            boolean z = false;
            if (this.currentToken.length() == 0) {
                return false;
            }
            char charAt = this.currentToken.charAt(0);
            if (('0' <= charAt && charAt <= '9') || charAt == '-' || charAt == '+') {
                z = true;
            }
            return z;
        }

        public void nextToken() {
            this.previousLine = this.line;
            this.previousColumn = this.column;
            while (this.pos < this.matcher.regionStart()) {
                if (this.text.charAt(this.pos) == 10) {
                    this.line++;
                    this.column = 0;
                } else {
                    this.column++;
                }
                this.pos++;
            }
            if (this.matcher.regionStart() == this.matcher.regionEnd()) {
                this.currentToken = "";
                return;
            }
            this.matcher.usePattern(TOKEN);
            if (this.matcher.lookingAt()) {
                this.currentToken = this.matcher.group();
                this.matcher.region(this.matcher.end(), this.matcher.regionEnd());
            } else {
                this.currentToken = String.valueOf(this.text.charAt(this.pos));
                this.matcher.region(this.pos + 1, this.matcher.regionEnd());
            }
            skipWhitespace();
        }

        public ParseException parseException(String str) {
            return new ParseException(this.line + 1, this.column + 1, str);
        }

        public ParseException parseExceptionPreviousToken(String str) {
            return new ParseException(this.previousLine + 1, this.previousColumn + 1, str);
        }

        public boolean tryConsume(String str) {
            if (!this.currentToken.equals(str)) {
                return false;
            }
            nextToken();
            return true;
        }

        public boolean tryConsumeDouble() {
            try {
                consumeDouble();
                return true;
            } catch (ParseException unused) {
                return false;
            }
        }

        public boolean tryConsumeFloat() {
            try {
                consumeFloat();
                return true;
            } catch (ParseException unused) {
                return false;
            }
        }

        public boolean tryConsumeIdentifier() {
            try {
                consumeIdentifier();
                return true;
            } catch (ParseException unused) {
                return false;
            }
        }

        public boolean tryConsumeInt64() {
            try {
                consumeInt64();
                return true;
            } catch (ParseException unused) {
                return false;
            }
        }

        public boolean tryConsumeString() {
            try {
                consumeString();
                return true;
            } catch (ParseException unused) {
                return false;
            }
        }

        public boolean tryConsumeUInt64() {
            try {
                consumeUInt64();
                return true;
            } catch (ParseException unused) {
                return false;
            }
        }

        public UnknownFieldParseException unknownFieldParseExceptionPreviousToken(String str, String str2) {
            return new UnknownFieldParseException(this.previousLine + 1, this.previousColumn + 1, str, str2);
        }
    }

    public static class UnknownFieldParseException extends ParseException {
        private final String unknownField;

        public UnknownFieldParseException(int i, int i2, String str, String str2) {
            super(i, i2, str2);
            this.unknownField = str;
        }

        public UnknownFieldParseException(String str) {
            this(-1, -1, "", str);
        }

        public String getUnknownField() {
            return this.unknownField;
        }
    }

    private TextFormat() {
    }

    private static int digitValue(byte b) {
        return (48 > b || b > 57) ? (97 > b || b > 122) ? (b - 65) + 10 : (b - 97) + 10 : b - 48;
    }

    public static String escapeBytes(ByteString byteString) {
        return TextFormatEscaper.escapeBytes(byteString);
    }

    public static String escapeBytes(byte[] bArr) {
        return TextFormatEscaper.escapeBytes(bArr);
    }

    public static String escapeDoubleQuotesAndBackslashes(String str) {
        return TextFormatEscaper.escapeDoubleQuotesAndBackslashes(str);
    }

    static String escapeText(String str) {
        return escapeBytes(ByteString.copyFromUtf8(str));
    }

    public static Parser getParser() {
        return PARSER;
    }

    private static boolean isHex(byte b) {
        return (48 <= b && b <= 57) || (97 <= b && b <= 102) || (65 <= b && b <= 70);
    }

    private static boolean isOctal(byte b) {
        return 48 <= b && b <= 55;
    }

    public static void merge(CharSequence charSequence, ExtensionRegistry extensionRegistry, Builder builder) throws ParseException {
        PARSER.merge(charSequence, extensionRegistry, builder);
    }

    public static void merge(CharSequence charSequence, Builder builder) throws ParseException {
        PARSER.merge(charSequence, builder);
    }

    public static void merge(Readable readable, ExtensionRegistry extensionRegistry, Builder builder) throws IOException {
        PARSER.merge(readable, extensionRegistry, builder);
    }

    public static void merge(Readable readable, Builder builder) throws IOException {
        PARSER.merge(readable, builder);
    }

    private static TextGenerator multiLineOutput(Appendable appendable) {
        return new TextGenerator(appendable, false);
    }

    public static <T extends Message> T parse(CharSequence charSequence, ExtensionRegistry extensionRegistry, Class<T> cls) throws ParseException {
        Builder newBuilderForType = ((Message) Internal.getDefaultInstance(cls)).newBuilderForType();
        merge(charSequence, extensionRegistry, newBuilderForType);
        return newBuilderForType.build();
    }

    public static <T extends Message> T parse(CharSequence charSequence, Class<T> cls) throws ParseException {
        Builder newBuilderForType = ((Message) Internal.getDefaultInstance(cls)).newBuilderForType();
        merge(charSequence, newBuilderForType);
        return newBuilderForType.build();
    }

    static int parseInt32(String str) throws NumberFormatException {
        return (int) parseInteger(str, true, false);
    }

    static long parseInt64(String str) throws NumberFormatException {
        return parseInteger(str, true, true);
    }

    private static long parseInteger(String str, boolean z, boolean z2) throws NumberFormatException {
        int i = 0;
        boolean z3 = true;
        if (!str.startsWith("-", 0)) {
            z3 = false;
        } else if (z) {
            i = 1;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Number must be positive: ");
            sb.append(str);
            throw new NumberFormatException(sb.toString());
        }
        int i2 = 10;
        if (str.startsWith("0x", i)) {
            i += 2;
            i2 = 16;
        } else if (str.startsWith(MovieStatUtils.DOWNLOAD_SUCCESS, i)) {
            i2 = 8;
        }
        String substring = str.substring(i);
        if (substring.length() < 16) {
            long parseLong = Long.parseLong(substring, i2);
            if (z3) {
                parseLong = -parseLong;
            }
            if (z2) {
                return parseLong;
            }
            if (z) {
                if (parseLong <= 2147483647L && parseLong >= -2147483648L) {
                    return parseLong;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Number out of range for 32-bit signed integer: ");
                sb2.append(str);
                throw new NumberFormatException(sb2.toString());
            } else if (parseLong < 4294967296L && parseLong >= 0) {
                return parseLong;
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Number out of range for 32-bit unsigned integer: ");
                sb3.append(str);
                throw new NumberFormatException(sb3.toString());
            }
        } else {
            BigInteger bigInteger = new BigInteger(substring, i2);
            if (z3) {
                bigInteger = bigInteger.negate();
            }
            if (!z2) {
                if (z) {
                    if (bigInteger.bitLength() > 31) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("Number out of range for 32-bit signed integer: ");
                        sb4.append(str);
                        throw new NumberFormatException(sb4.toString());
                    }
                } else if (bigInteger.bitLength() > 32) {
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("Number out of range for 32-bit unsigned integer: ");
                    sb5.append(str);
                    throw new NumberFormatException(sb5.toString());
                }
            } else if (z) {
                if (bigInteger.bitLength() > 63) {
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("Number out of range for 64-bit signed integer: ");
                    sb6.append(str);
                    throw new NumberFormatException(sb6.toString());
                }
            } else if (bigInteger.bitLength() > 64) {
                StringBuilder sb7 = new StringBuilder();
                sb7.append("Number out of range for 64-bit unsigned integer: ");
                sb7.append(str);
                throw new NumberFormatException(sb7.toString());
            }
            return bigInteger.longValue();
        }
    }

    static int parseUInt32(String str) throws NumberFormatException {
        return (int) parseInteger(str, false, false);
    }

    static long parseUInt64(String str) throws NumberFormatException {
        return parseInteger(str, false, true);
    }

    public static void print(MessageOrBuilder messageOrBuilder, Appendable appendable) throws IOException {
        Printer.DEFAULT.print(messageOrBuilder, multiLineOutput(appendable));
    }

    public static void print(UnknownFieldSet unknownFieldSet, Appendable appendable) throws IOException {
        Printer.DEFAULT.printUnknownFields(unknownFieldSet, multiLineOutput(appendable));
    }

    public static void printField(FieldDescriptor fieldDescriptor, Object obj, Appendable appendable) throws IOException {
        Printer.DEFAULT.printField(fieldDescriptor, obj, multiLineOutput(appendable));
    }

    public static String printFieldToString(FieldDescriptor fieldDescriptor, Object obj) {
        try {
            StringBuilder sb = new StringBuilder();
            printField(fieldDescriptor, obj, sb);
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static void printFieldValue(FieldDescriptor fieldDescriptor, Object obj, Appendable appendable) throws IOException {
        Printer.DEFAULT.printFieldValue(fieldDescriptor, obj, multiLineOutput(appendable));
    }

    public static String printToString(MessageOrBuilder messageOrBuilder) {
        try {
            StringBuilder sb = new StringBuilder();
            print(messageOrBuilder, (Appendable) sb);
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static String printToString(UnknownFieldSet unknownFieldSet) {
        try {
            StringBuilder sb = new StringBuilder();
            print(unknownFieldSet, (Appendable) sb);
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static String printToUnicodeString(MessageOrBuilder messageOrBuilder) {
        try {
            StringBuilder sb = new StringBuilder();
            Printer.UNICODE.print(messageOrBuilder, multiLineOutput(sb));
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static String printToUnicodeString(UnknownFieldSet unknownFieldSet) {
        try {
            StringBuilder sb = new StringBuilder();
            Printer.UNICODE.printUnknownFields(unknownFieldSet, multiLineOutput(sb));
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static void printUnicode(MessageOrBuilder messageOrBuilder, Appendable appendable) throws IOException {
        Printer.UNICODE.print(messageOrBuilder, multiLineOutput(appendable));
    }

    public static void printUnicode(UnknownFieldSet unknownFieldSet, Appendable appendable) throws IOException {
        Printer.UNICODE.printUnknownFields(unknownFieldSet, multiLineOutput(appendable));
    }

    public static void printUnicodeFieldValue(FieldDescriptor fieldDescriptor, Object obj, Appendable appendable) throws IOException {
        Printer.UNICODE.printFieldValue(fieldDescriptor, obj, multiLineOutput(appendable));
    }

    /* access modifiers changed from: private */
    public static void printUnknownFieldValue(int i, Object obj, TextGenerator textGenerator) throws IOException {
        int tagWireType = WireFormat.getTagWireType(i);
        if (tagWireType != 5) {
            switch (tagWireType) {
                case 0:
                    textGenerator.print(unsignedToString(((Long) obj).longValue()));
                    return;
                case 1:
                    textGenerator.print(String.format(null, "0x%016x", new Object[]{(Long) obj}));
                    return;
                case 2:
                    try {
                        UnknownFieldSet parseFrom = UnknownFieldSet.parseFrom((ByteString) obj);
                        textGenerator.print("{");
                        textGenerator.eol();
                        textGenerator.indent();
                        Printer.DEFAULT.printUnknownFields(parseFrom, textGenerator);
                        textGenerator.outdent();
                        textGenerator.print("}");
                        return;
                    } catch (InvalidProtocolBufferException unused) {
                        textGenerator.print("\"");
                        textGenerator.print(escapeBytes((ByteString) obj));
                        textGenerator.print("\"");
                        return;
                    }
                case 3:
                    Printer.DEFAULT.printUnknownFields((UnknownFieldSet) obj, textGenerator);
                    return;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Bad tag: ");
                    sb.append(i);
                    throw new IllegalArgumentException(sb.toString());
            }
        } else {
            textGenerator.print(String.format(null, "0x%08x", new Object[]{(Integer) obj}));
        }
    }

    public static void printUnknownFieldValue(int i, Object obj, Appendable appendable) throws IOException {
        printUnknownFieldValue(i, obj, multiLineOutput(appendable));
    }

    public static String shortDebugString(FieldDescriptor fieldDescriptor, Object obj) {
        try {
            StringBuilder sb = new StringBuilder();
            Printer.DEFAULT.printField(fieldDescriptor, obj, singleLineOutput(sb));
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static String shortDebugString(MessageOrBuilder messageOrBuilder) {
        try {
            StringBuilder sb = new StringBuilder();
            Printer.DEFAULT.print(messageOrBuilder, singleLineOutput(sb));
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static String shortDebugString(UnknownFieldSet unknownFieldSet) {
        try {
            StringBuilder sb = new StringBuilder();
            Printer.DEFAULT.printUnknownFields(unknownFieldSet, singleLineOutput(sb));
            return sb.toString();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    private static TextGenerator singleLineOutput(Appendable appendable) {
        return new TextGenerator(appendable, true);
    }

    public static ByteString unescapeBytes(CharSequence charSequence) throws InvalidEscapeSequenceException {
        int i;
        int i2;
        int i3;
        ByteString copyFromUtf8 = ByteString.copyFromUtf8(charSequence.toString());
        byte[] bArr = new byte[copyFromUtf8.size()];
        int i4 = 0;
        int i5 = 0;
        while (i < copyFromUtf8.size()) {
            byte byteAt = copyFromUtf8.byteAt(i);
            if (byteAt == 92) {
                i++;
                if (i < copyFromUtf8.size()) {
                    byte byteAt2 = copyFromUtf8.byteAt(i);
                    if (isOctal(byteAt2)) {
                        int digitValue = digitValue(byteAt2);
                        int i6 = i + 1;
                        if (i6 < copyFromUtf8.size() && isOctal(copyFromUtf8.byteAt(i6))) {
                            digitValue = (digitValue * 8) + digitValue(copyFromUtf8.byteAt(i6));
                            i = i6;
                        }
                        int i7 = i + 1;
                        if (i7 < copyFromUtf8.size() && isOctal(copyFromUtf8.byteAt(i7))) {
                            digitValue = (digitValue * 8) + digitValue(copyFromUtf8.byteAt(i7));
                            i = i7;
                        }
                        i2 = i5 + 1;
                        bArr[i5] = (byte) digitValue;
                    } else {
                        if (byteAt2 == 34) {
                            i3 = i5 + 1;
                            bArr[i5] = 34;
                        } else if (byteAt2 == 39) {
                            i3 = i5 + 1;
                            bArr[i5] = 39;
                        } else if (byteAt2 == 92) {
                            i3 = i5 + 1;
                            bArr[i5] = 92;
                        } else if (byteAt2 == 102) {
                            i3 = i5 + 1;
                            bArr[i5] = 12;
                        } else if (byteAt2 == 110) {
                            i3 = i5 + 1;
                            bArr[i5] = 10;
                        } else if (byteAt2 == 114) {
                            i3 = i5 + 1;
                            bArr[i5] = 13;
                        } else if (byteAt2 == 116) {
                            i3 = i5 + 1;
                            bArr[i5] = 9;
                        } else if (byteAt2 == 118) {
                            i3 = i5 + 1;
                            bArr[i5] = 11;
                        } else if (byteAt2 != 120) {
                            switch (byteAt2) {
                                case BaiduSceneResult.SKATEBOARD /*97*/:
                                    i3 = i5 + 1;
                                    bArr[i5] = 7;
                                    break;
                                case BaiduSceneResult.GOLF /*98*/:
                                    i3 = i5 + 1;
                                    bArr[i5] = 8;
                                    break;
                                default:
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("Invalid escape sequence: '\\");
                                    sb.append((char) byteAt2);
                                    sb.append('\'');
                                    throw new InvalidEscapeSequenceException(sb.toString());
                            }
                        } else {
                            i++;
                            if (i >= copyFromUtf8.size() || !isHex(copyFromUtf8.byteAt(i))) {
                                throw new InvalidEscapeSequenceException("Invalid escape sequence: '\\x' with no digits");
                            }
                            int digitValue2 = digitValue(copyFromUtf8.byteAt(i));
                            int i8 = i + 1;
                            if (i8 < copyFromUtf8.size() && isHex(copyFromUtf8.byteAt(i8))) {
                                digitValue2 = (digitValue2 * 16) + digitValue(copyFromUtf8.byteAt(i8));
                                i = i8;
                            }
                            i2 = i5 + 1;
                            bArr[i5] = (byte) digitValue2;
                        }
                        i5 = i3;
                        i4 = i + 1;
                    }
                } else {
                    throw new InvalidEscapeSequenceException("Invalid escape sequence: '\\' at end of string.");
                }
            } else {
                i2 = i5 + 1;
                bArr[i5] = byteAt;
            }
            i5 = i2;
            i4 = i + 1;
        }
        return bArr.length == i5 ? ByteString.wrap(bArr) : ByteString.copyFrom(bArr, 0, i5);
    }

    static String unescapeText(String str) throws InvalidEscapeSequenceException {
        return unescapeBytes(str).toStringUtf8();
    }

    public static String unsignedToString(int i) {
        return i >= 0 ? Integer.toString(i) : Long.toString(((long) i) & 4294967295L);
    }

    public static String unsignedToString(long j) {
        return j >= 0 ? Long.toString(j) : BigInteger.valueOf(j & Long.MAX_VALUE).setBit(63).toString();
    }
}
