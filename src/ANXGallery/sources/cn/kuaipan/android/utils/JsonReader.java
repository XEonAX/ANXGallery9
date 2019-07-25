package cn.kuaipan.android.utils;

import android.text.TextUtils;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

public final class JsonReader implements Closeable {
    private final char[] buffer = new char[1024];
    private int bufferStartColumn = 1;
    private int bufferStartLine = 1;
    private final Reader in;
    private boolean lenient = false;
    private int limit = 0;
    private String name;
    private int pos = 0;
    private boolean skipping;
    private final List<JsonScope> stack = new ArrayList();
    private final StringPool stringPool = new StringPool();
    private JsonToken token;
    private String value;
    private int valueLength;
    private int valuePos;

    public JsonReader(Reader reader) {
        push(JsonScope.EMPTY_DOCUMENT);
        this.skipping = false;
        if (reader != null) {
            this.in = reader;
            return;
        }
        throw new NullPointerException("in == null");
    }

    private JsonToken advance() throws IOException {
        peek();
        JsonToken jsonToken = this.token;
        this.token = null;
        this.value = null;
        this.name = null;
        return jsonToken;
    }

    private void checkLenient() throws IOException {
        if (!this.lenient) {
            throw syntaxError("Use JsonReader.setLenient(true) to accept malformed JSON");
        }
    }

    private JsonToken decodeLiteral() throws IOException {
        if (this.valuePos == -1) {
            return JsonToken.STRING;
        }
        if (this.valueLength == 4 && (('n' == this.buffer[this.valuePos] || 'N' == this.buffer[this.valuePos]) && (('u' == this.buffer[this.valuePos + 1] || 'U' == this.buffer[this.valuePos + 1]) && (('l' == this.buffer[this.valuePos + 2] || 'L' == this.buffer[this.valuePos + 2]) && ('l' == this.buffer[this.valuePos + 3] || 'L' == this.buffer[this.valuePos + 3]))))) {
            this.value = "null";
            return JsonToken.NULL;
        } else if (this.valueLength == 4 && (('t' == this.buffer[this.valuePos] || 'T' == this.buffer[this.valuePos]) && (('r' == this.buffer[this.valuePos + 1] || 'R' == this.buffer[this.valuePos + 1]) && (('u' == this.buffer[this.valuePos + 2] || 'U' == this.buffer[this.valuePos + 2]) && ('e' == this.buffer[this.valuePos + 3] || 'E' == this.buffer[this.valuePos + 3]))))) {
            this.value = "true";
            return JsonToken.BOOLEAN;
        } else if (this.valueLength == 5 && (('f' == this.buffer[this.valuePos] || 'F' == this.buffer[this.valuePos]) && (('a' == this.buffer[this.valuePos + 1] || 'A' == this.buffer[this.valuePos + 1]) && (('l' == this.buffer[this.valuePos + 2] || 'L' == this.buffer[this.valuePos + 2]) && (('s' == this.buffer[this.valuePos + 3] || 'S' == this.buffer[this.valuePos + 3]) && ('e' == this.buffer[this.valuePos + 4] || 'E' == this.buffer[this.valuePos + 4])))))) {
            this.value = "false";
            return JsonToken.BOOLEAN;
        } else {
            this.value = this.stringPool.get(this.buffer, this.valuePos, this.valueLength);
            return decodeNumber(this.buffer, this.valuePos, this.valueLength);
        }
    }

    private JsonToken decodeNumber(char[] cArr, int i, int i2) {
        int i3;
        int i4;
        char c;
        char c2 = cArr[i];
        if (c2 == '-') {
            int i5 = i + 1;
            i3 = i5;
            c2 = cArr[i5];
        } else {
            i3 = i;
        }
        if (c2 == '0') {
            i4 = i3 + 1;
            c = cArr[i4];
        } else if (c2 < '1' || c2 > '9') {
            return JsonToken.STRING;
        } else {
            i4 = i3 + 1;
            c = cArr[i4];
            while (c >= '0' && c <= '9') {
                i4++;
                c = cArr[i4];
            }
        }
        if (c == '.') {
            int i6 = i4 + 1;
            char c3 = cArr[i6];
            while (c >= '0' && c <= '9') {
                i6 = i4 + 1;
                c3 = cArr[i6];
            }
        }
        if (c == 'e' || c == 'E') {
            int i7 = i4 + 1;
            char c4 = cArr[i7];
            if (c4 == '+' || c4 == '-') {
                i7++;
                c4 = cArr[i7];
            }
            if (c4 < '0' || c4 > '9') {
                return JsonToken.STRING;
            }
            int i8 = i7 + 1;
            char c5 = cArr[i8];
            while (c5 >= '0' && c5 <= '9') {
                i8 = i4 + 1;
                c5 = cArr[i8];
            }
        }
        return i4 == i + i2 ? JsonToken.NUMBER : JsonToken.STRING;
    }

    private void expect(JsonToken jsonToken) throws IOException {
        peek();
        if (this.token == jsonToken) {
            advance();
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected ");
        sb.append(jsonToken);
        sb.append(" but was ");
        sb.append(peek());
        throw new IllegalStateException(sb.toString());
    }

    private boolean fillBuffer(int i) throws IOException {
        for (int i2 = 0; i2 < this.pos; i2++) {
            if (this.buffer[i2] == 10) {
                this.bufferStartLine++;
                this.bufferStartColumn = 1;
            } else {
                this.bufferStartColumn++;
            }
        }
        if (this.limit != this.pos) {
            this.limit -= this.pos;
            System.arraycopy(this.buffer, this.pos, this.buffer, 0, this.limit);
        } else {
            this.limit = 0;
        }
        this.pos = 0;
        do {
            int read = this.in.read(this.buffer, this.limit, this.buffer.length - this.limit);
            if (read == -1) {
                return false;
            }
            this.limit += read;
            if (this.bufferStartLine == 1 && this.bufferStartColumn == 1 && this.limit > 0 && this.buffer[0] == 65279) {
                this.pos++;
                this.bufferStartColumn--;
            }
        } while (this.limit < i);
        return true;
    }

    private int getColumnNumber() {
        int i = this.bufferStartColumn;
        for (int i2 = 0; i2 < this.pos; i2++) {
            i = this.buffer[i2] == 10 ? 1 : i + 1;
        }
        return i;
    }

    private int getLineNumber() {
        int i = this.bufferStartLine;
        for (int i2 = 0; i2 < this.pos; i2++) {
            if (this.buffer[i2] == 10) {
                i++;
            }
        }
        return i;
    }

    private CharSequence getSnippet() {
        StringBuilder sb = new StringBuilder();
        int min = Math.min(this.pos, 20);
        sb.append(this.buffer, this.pos - min, min);
        sb.append(this.buffer, this.pos, Math.min(this.limit - this.pos, 20));
        return sb;
    }

    private JsonToken nextInArray(boolean z) throws IOException {
        if (z) {
            replaceTop(JsonScope.NONEMPTY_ARRAY);
        } else {
            int nextNonWhitespace = nextNonWhitespace();
            if (nextNonWhitespace != 44) {
                if (nextNonWhitespace == 59) {
                    checkLenient();
                } else if (nextNonWhitespace == 93) {
                    pop();
                    JsonToken jsonToken = JsonToken.END_ARRAY;
                    this.token = jsonToken;
                    return jsonToken;
                } else {
                    throw syntaxError("Unterminated array");
                }
            }
        }
        int nextNonWhitespace2 = nextNonWhitespace();
        if (!(nextNonWhitespace2 == 44 || nextNonWhitespace2 == 59)) {
            if (nextNonWhitespace2 != 93) {
                this.pos--;
                return nextValue();
            } else if (z) {
                pop();
                JsonToken jsonToken2 = JsonToken.END_ARRAY;
                this.token = jsonToken2;
                return jsonToken2;
            }
        }
        checkLenient();
        this.pos--;
        this.value = "null";
        JsonToken jsonToken3 = JsonToken.NULL;
        this.token = jsonToken3;
        return jsonToken3;
    }

    private JsonToken nextInObject(boolean z) throws IOException {
        if (!z) {
            int nextNonWhitespace = nextNonWhitespace();
            if (!(nextNonWhitespace == 44 || nextNonWhitespace == 59)) {
                if (nextNonWhitespace == 125) {
                    pop();
                    JsonToken jsonToken = JsonToken.END_OBJECT;
                    this.token = jsonToken;
                    return jsonToken;
                }
                throw syntaxError("Unterminated object");
            }
        } else if (nextNonWhitespace() != 125) {
            this.pos--;
        } else {
            pop();
            JsonToken jsonToken2 = JsonToken.END_OBJECT;
            this.token = jsonToken2;
            return jsonToken2;
        }
        int nextNonWhitespace2 = nextNonWhitespace();
        if (nextNonWhitespace2 != 34) {
            if (nextNonWhitespace2 != 39) {
                checkLenient();
                this.pos--;
                this.name = nextLiteral(false);
                if (TextUtils.isEmpty(this.name)) {
                    throw syntaxError("Expected name");
                }
                replaceTop(JsonScope.DANGLING_NAME);
                JsonToken jsonToken3 = JsonToken.NAME;
                this.token = jsonToken3;
                return jsonToken3;
            }
            checkLenient();
        }
        this.name = nextString((char) nextNonWhitespace2);
        replaceTop(JsonScope.DANGLING_NAME);
        JsonToken jsonToken32 = JsonToken.NAME;
        this.token = jsonToken32;
        return jsonToken32;
    }

    private String nextLiteral(boolean z) throws IOException {
        int i;
        this.valuePos = -1;
        int i2 = 0;
        this.valueLength = 0;
        String str = null;
        StringBuilder sb = null;
        while (true) {
            i = 0;
            while (true) {
                if (this.pos + i < this.limit) {
                    switch (this.buffer[this.pos + i]) {
                        case 9:
                        case 10:
                        case 12:
                        case 13:
                        case ' ':
                        case ',':
                        case ':':
                        case BaiduSceneResult.RIDING /*91*/:
                        case BaiduSceneResult.SNORKELING_DIVE /*93*/:
                        case BaiduSceneResult.TRAIN /*123*/:
                        case BaiduSceneResult.TRAVEL_OTHER /*125*/:
                            break;
                        case '#':
                        case '/':
                        case ';':
                        case '=':
                        case BaiduSceneResult.SURF /*92*/:
                            checkLenient();
                            break;
                        default:
                            i++;
                            break;
                    }
                } else if (i >= this.buffer.length) {
                    if (sb == null) {
                        sb = new StringBuilder();
                    }
                    sb.append(this.buffer, this.pos, i);
                    this.valueLength += i;
                    this.pos += i;
                    if (!fillBuffer(1)) {
                    }
                } else if (!fillBuffer(i + 1)) {
                    this.buffer[this.limit] = 0;
                }
            }
        }
        i2 = i;
        if (z && sb == null) {
            this.valuePos = this.pos;
        } else if (this.skipping) {
            str = "skipped!";
        } else if (sb == null) {
            str = this.stringPool.get(this.buffer, this.pos, i2);
        } else {
            sb.append(this.buffer, this.pos, i2);
            str = sb.toString();
        }
        this.valueLength += i2;
        this.pos += i2;
        return str;
    }

    private int nextNonWhitespace() throws IOException {
        while (true) {
            if (this.pos < this.limit || fillBuffer(1)) {
                char[] cArr = this.buffer;
                int i = this.pos;
                this.pos = i + 1;
                char c = cArr[i];
                if (!(c == 13 || c == ' ')) {
                    if (c == '#') {
                        checkLenient();
                        skipToEndOfLine();
                    } else if (c != '/') {
                        switch (c) {
                            case 9:
                            case 10:
                                break;
                            default:
                                return c;
                        }
                    } else if (this.pos == this.limit && !fillBuffer(1)) {
                        return c;
                    } else {
                        checkLenient();
                        char c2 = this.buffer[this.pos];
                        if (c2 == '*') {
                            this.pos++;
                            if (skipTo("*/")) {
                                this.pos += 2;
                            } else {
                                throw syntaxError("Unterminated comment");
                            }
                        } else if (c2 != '/') {
                            return c;
                        } else {
                            this.pos++;
                            skipToEndOfLine();
                        }
                    }
                }
            } else {
                throw new EOFException("End of input");
            }
        }
    }

    private String nextString(char c) throws IOException {
        StringBuilder sb = null;
        do {
            int i = this.pos;
            while (this.pos < this.limit) {
                char[] cArr = this.buffer;
                int i2 = this.pos;
                this.pos = i2 + 1;
                char c2 = cArr[i2];
                if (c2 == c) {
                    if (this.skipping) {
                        return "skipped!";
                    }
                    if (sb == null) {
                        return this.stringPool.get(this.buffer, i, (this.pos - i) - 1);
                    }
                    sb.append(this.buffer, i, (this.pos - i) - 1);
                    return sb.toString();
                } else if (c2 == '\\') {
                    if (sb == null) {
                        sb = new StringBuilder();
                    }
                    sb.append(this.buffer, i, (this.pos - i) - 1);
                    sb.append(readEscapeCharacter());
                    i = this.pos;
                }
            }
            if (sb == null) {
                sb = new StringBuilder();
            }
            sb.append(this.buffer, i, this.pos - i);
        } while (fillBuffer(1));
        throw syntaxError("Unterminated string");
    }

    private JsonToken nextValue() throws IOException {
        int nextNonWhitespace = nextNonWhitespace();
        if (nextNonWhitespace != 34) {
            if (nextNonWhitespace == 39) {
                checkLenient();
            } else if (nextNonWhitespace == 91) {
                push(JsonScope.EMPTY_ARRAY);
                JsonToken jsonToken = JsonToken.BEGIN_ARRAY;
                this.token = jsonToken;
                return jsonToken;
            } else if (nextNonWhitespace != 123) {
                this.pos--;
                return readLiteral();
            } else {
                push(JsonScope.EMPTY_OBJECT);
                JsonToken jsonToken2 = JsonToken.BEGIN_OBJECT;
                this.token = jsonToken2;
                return jsonToken2;
            }
        }
        this.value = nextString((char) nextNonWhitespace);
        JsonToken jsonToken3 = JsonToken.STRING;
        this.token = jsonToken3;
        return jsonToken3;
    }

    private JsonToken objectValue() throws IOException {
        int nextNonWhitespace = nextNonWhitespace();
        if (nextNonWhitespace != 58) {
            if (nextNonWhitespace == 61) {
                checkLenient();
                if ((this.pos < this.limit || fillBuffer(1)) && this.buffer[this.pos] == '>') {
                    this.pos++;
                }
            } else {
                throw syntaxError("Expected ':'");
            }
        }
        replaceTop(JsonScope.NONEMPTY_OBJECT);
        return nextValue();
    }

    private JsonScope peekStack() {
        return (JsonScope) this.stack.get(this.stack.size() - 1);
    }

    private JsonScope pop() {
        return (JsonScope) this.stack.remove(this.stack.size() - 1);
    }

    private void push(JsonScope jsonScope) {
        this.stack.add(jsonScope);
    }

    private char readEscapeCharacter() throws IOException {
        if (this.pos != this.limit || fillBuffer(1)) {
            char[] cArr = this.buffer;
            int i = this.pos;
            this.pos = i + 1;
            char c = cArr[i];
            if (c == 'b') {
                return 8;
            }
            if (c == 'f') {
                return 12;
            }
            if (c == 'n') {
                return 10;
            }
            if (c == 'r') {
                return 13;
            }
            switch (c) {
                case BaiduSceneResult.CAR /*116*/:
                    return 9;
                case BaiduSceneResult.FERRY /*117*/:
                    if (this.pos + 4 <= this.limit || fillBuffer(4)) {
                        String str = this.stringPool.get(this.buffer, this.pos, 4);
                        this.pos += 4;
                        return (char) Integer.parseInt(str, 16);
                    }
                    throw syntaxError("Unterminated escape sequence");
                default:
                    return c;
            }
        } else {
            throw syntaxError("Unterminated escape sequence");
        }
    }

    private JsonToken readLiteral() throws IOException {
        this.value = nextLiteral(true);
        if (this.valueLength != 0) {
            this.token = decodeLiteral();
            if (this.token == JsonToken.STRING) {
                checkLenient();
            }
            return this.token;
        }
        throw syntaxError("Expected literal value");
    }

    private void replaceTop(JsonScope jsonScope) {
        this.stack.set(this.stack.size() - 1, jsonScope);
    }

    private boolean skipTo(String str) throws IOException {
        while (true) {
            int i = 0;
            if (this.pos + str.length() > this.limit && !fillBuffer(str.length())) {
                return false;
            }
            while (i < str.length()) {
                if (this.buffer[this.pos + i] != str.charAt(i)) {
                    this.pos++;
                } else {
                    i++;
                }
            }
            return true;
        }
    }

    private void skipToEndOfLine() throws IOException {
        char c;
        do {
            if (this.pos < this.limit || fillBuffer(1)) {
                char[] cArr = this.buffer;
                int i = this.pos;
                this.pos = i + 1;
                c = cArr[i];
                if (c == 13) {
                    return;
                }
            } else {
                return;
            }
        } while (c != 10);
    }

    private IOException syntaxError(String str) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        throw new MalformedJsonException(sb.toString());
    }

    public void beginArray() throws IOException {
        expect(JsonToken.BEGIN_ARRAY);
    }

    public void beginObject() throws IOException {
        expect(JsonToken.BEGIN_OBJECT);
    }

    public void close() throws IOException {
        this.value = null;
        this.token = null;
        this.stack.clear();
        this.stack.add(JsonScope.CLOSED);
        this.in.close();
    }

    public void endArray() throws IOException {
        expect(JsonToken.END_ARRAY);
    }

    public void endObject() throws IOException {
        expect(JsonToken.END_OBJECT);
    }

    public boolean nextBoolean() throws IOException {
        peek();
        if (this.token == JsonToken.BOOLEAN) {
            boolean z = this.value == "true";
            advance();
            return z;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected a boolean but was ");
        sb.append(this.token);
        throw new IllegalStateException(sb.toString());
    }

    public double nextDouble() throws IOException {
        peek();
        if (this.token == JsonToken.STRING || this.token == JsonToken.NUMBER) {
            double parseDouble = Double.parseDouble(this.value);
            advance();
            return parseDouble;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected a double but was ");
        sb.append(this.token);
        throw new IllegalStateException(sb.toString());
    }

    public int nextInt() throws IOException {
        int i;
        peek();
        if (this.token == JsonToken.STRING || this.token == JsonToken.NUMBER) {
            try {
                i = Integer.parseInt(this.value);
            } catch (NumberFormatException unused) {
                double parseDouble = Double.parseDouble(this.value);
                int i2 = (int) parseDouble;
                if (((double) i2) == parseDouble) {
                    i = i2;
                } else {
                    throw new NumberFormatException(this.value);
                }
            }
            advance();
            return i;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected an int but was ");
        sb.append(this.token);
        throw new IllegalStateException(sb.toString());
    }

    public long nextLong() throws IOException {
        long j;
        peek();
        if (this.token == JsonToken.STRING || this.token == JsonToken.NUMBER) {
            try {
                j = Long.parseLong(this.value);
            } catch (NumberFormatException unused) {
                double parseDouble = Double.parseDouble(this.value);
                long j2 = (long) parseDouble;
                if (((double) j2) == parseDouble) {
                    j = j2;
                } else {
                    throw new NumberFormatException(this.value);
                }
            }
            advance();
            return j;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected a long but was ");
        sb.append(this.token);
        throw new IllegalStateException(sb.toString());
    }

    public String nextName() throws IOException {
        peek();
        if (this.token == JsonToken.NAME) {
            String str = this.name;
            advance();
            return str;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected a name but was ");
        sb.append(peek());
        throw new IllegalStateException(sb.toString());
    }

    public void nextNull() throws IOException {
        peek();
        if (this.token == JsonToken.NULL) {
            advance();
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected null but was ");
        sb.append(this.token);
        throw new IllegalStateException(sb.toString());
    }

    public String nextString() throws IOException {
        peek();
        if (this.token == JsonToken.STRING || this.token == JsonToken.NUMBER) {
            String str = this.value;
            advance();
            return str;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected a string but was ");
        sb.append(peek());
        throw new IllegalStateException(sb.toString());
    }

    public JsonToken peek() throws IOException {
        if (this.token != null) {
            return this.token;
        }
        switch (peekStack()) {
            case EMPTY_DOCUMENT:
                replaceTop(JsonScope.NONEMPTY_DOCUMENT);
                JsonToken nextValue = nextValue();
                if (this.lenient || this.token == JsonToken.BEGIN_ARRAY || this.token == JsonToken.BEGIN_OBJECT) {
                    return nextValue;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Expected JSON document to start with '[' or '{' but was ");
                sb.append(this.token);
                throw new IOException(sb.toString());
            case EMPTY_ARRAY:
                return nextInArray(true);
            case NONEMPTY_ARRAY:
                return nextInArray(false);
            case EMPTY_OBJECT:
                return nextInObject(true);
            case DANGLING_NAME:
                return objectValue();
            case NONEMPTY_OBJECT:
                return nextInObject(false);
            case NONEMPTY_DOCUMENT:
                try {
                    JsonToken nextValue2 = nextValue();
                    if (this.lenient) {
                        return nextValue2;
                    }
                    throw syntaxError("Expected EOF");
                } catch (EOFException unused) {
                    JsonToken jsonToken = JsonToken.END_DOCUMENT;
                    this.token = jsonToken;
                    return jsonToken;
                }
            case CLOSED:
                throw new IllegalStateException("JsonReader is closed");
            default:
                throw new AssertionError();
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" near ");
        sb.append(getSnippet());
        return sb.toString();
    }
}
