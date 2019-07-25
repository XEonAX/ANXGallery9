package com.google.protobuf;

import com.google.protobuf.ByteString.ByteIterator;
import java.io.IOException;
import java.io.InputStream;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

final class RopeByteString extends ByteString {
    /* access modifiers changed from: private */
    public static final int[] minLengthByDepth;
    private static final long serialVersionUID = 1;
    /* access modifiers changed from: private */
    public final ByteString left;
    private final int leftLength;
    /* access modifiers changed from: private */
    public final ByteString right;
    private final int totalLength;
    private final int treeDepth;

    private static class Balancer {
        private final ArrayDeque<ByteString> prefixesStack;

        private Balancer() {
            this.prefixesStack = new ArrayDeque<>();
        }

        /* access modifiers changed from: private */
        public ByteString balance(ByteString byteString, ByteString byteString2) {
            doBalance(byteString);
            doBalance(byteString2);
            ByteString byteString3 = (ByteString) this.prefixesStack.pop();
            while (!this.prefixesStack.isEmpty()) {
                byteString3 = new RopeByteString((ByteString) this.prefixesStack.pop(), byteString3);
            }
            return byteString3;
        }

        private void doBalance(ByteString byteString) {
            if (byteString.isBalanced()) {
                insert(byteString);
            } else if (byteString instanceof RopeByteString) {
                RopeByteString ropeByteString = (RopeByteString) byteString;
                doBalance(ropeByteString.left);
                doBalance(ropeByteString.right);
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Has a new type of ByteString been created? Found ");
                sb.append(byteString.getClass());
                throw new IllegalArgumentException(sb.toString());
            }
        }

        private int getDepthBinForLength(int i) {
            int binarySearch = Arrays.binarySearch(RopeByteString.minLengthByDepth, i);
            return binarySearch < 0 ? (-(binarySearch + 1)) - 1 : binarySearch;
        }

        private void insert(ByteString byteString) {
            int depthBinForLength = getDepthBinForLength(byteString.size());
            int i = RopeByteString.minLengthByDepth[depthBinForLength + 1];
            if (this.prefixesStack.isEmpty() || ((ByteString) this.prefixesStack.peek()).size() >= i) {
                this.prefixesStack.push(byteString);
                return;
            }
            int i2 = RopeByteString.minLengthByDepth[depthBinForLength];
            ByteString byteString2 = (ByteString) this.prefixesStack.pop();
            while (!this.prefixesStack.isEmpty() && ((ByteString) this.prefixesStack.peek()).size() < i2) {
                byteString2 = new RopeByteString((ByteString) this.prefixesStack.pop(), byteString2);
            }
            RopeByteString ropeByteString = new RopeByteString(byteString2, byteString);
            while (!this.prefixesStack.isEmpty()) {
                if (((ByteString) this.prefixesStack.peek()).size() >= RopeByteString.minLengthByDepth[getDepthBinForLength(ropeByteString.size()) + 1]) {
                    break;
                }
                ropeByteString = new RopeByteString((ByteString) this.prefixesStack.pop(), ropeByteString);
            }
            this.prefixesStack.push(ropeByteString);
        }
    }

    private static final class PieceIterator implements Iterator<LeafByteString> {
        private final ArrayDeque<RopeByteString> breadCrumbs;
        private LeafByteString next;

        private PieceIterator(ByteString byteString) {
            this.breadCrumbs = new ArrayDeque<>();
            this.next = getLeafByLeft(byteString);
        }

        private LeafByteString getLeafByLeft(ByteString byteString) {
            while (byteString instanceof RopeByteString) {
                RopeByteString ropeByteString = (RopeByteString) byteString;
                this.breadCrumbs.push(ropeByteString);
                byteString = ropeByteString.left;
            }
            return (LeafByteString) byteString;
        }

        private LeafByteString getNextNonEmptyLeaf() {
            while (!this.breadCrumbs.isEmpty()) {
                LeafByteString leafByLeft = getLeafByLeft(((RopeByteString) this.breadCrumbs.pop()).right);
                if (!leafByLeft.isEmpty()) {
                    return leafByLeft;
                }
            }
            return null;
        }

        public boolean hasNext() {
            return this.next != null;
        }

        public LeafByteString next() {
            if (this.next != null) {
                LeafByteString leafByteString = this.next;
                this.next = getNextNonEmptyLeaf();
                return leafByteString;
            }
            throw new NoSuchElementException();
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    private class RopeInputStream extends InputStream {
        private LeafByteString currentPiece;
        private int currentPieceIndex;
        private int currentPieceOffsetInRope;
        private int currentPieceSize;
        private int mark;
        private PieceIterator pieceIterator;

        public RopeInputStream() {
            initialize();
        }

        private void advanceIfCurrentPieceFullyRead() {
            if (this.currentPiece != null && this.currentPieceIndex == this.currentPieceSize) {
                this.currentPieceOffsetInRope += this.currentPieceSize;
                this.currentPieceIndex = 0;
                if (this.pieceIterator.hasNext()) {
                    this.currentPiece = this.pieceIterator.next();
                    this.currentPieceSize = this.currentPiece.size();
                    return;
                }
                this.currentPiece = null;
                this.currentPieceSize = 0;
            }
        }

        private void initialize() {
            this.pieceIterator = new PieceIterator(RopeByteString.this);
            this.currentPiece = this.pieceIterator.next();
            this.currentPieceSize = this.currentPiece.size();
            this.currentPieceIndex = 0;
            this.currentPieceOffsetInRope = 0;
        }

        private int readSkipInternal(byte[] bArr, int i, int i2) {
            int i3 = i;
            int i4 = i2;
            while (true) {
                if (i4 <= 0) {
                    break;
                }
                advanceIfCurrentPieceFullyRead();
                if (this.currentPiece != null) {
                    int min = Math.min(this.currentPieceSize - this.currentPieceIndex, i4);
                    if (bArr != null) {
                        this.currentPiece.copyTo(bArr, this.currentPieceIndex, i3, min);
                        i3 += min;
                    }
                    this.currentPieceIndex += min;
                    i4 -= min;
                } else if (i4 == i2) {
                    return -1;
                }
            }
            return i2 - i4;
        }

        public int available() throws IOException {
            return RopeByteString.this.size() - (this.currentPieceOffsetInRope + this.currentPieceIndex);
        }

        public void mark(int i) {
            this.mark = this.currentPieceOffsetInRope + this.currentPieceIndex;
        }

        public boolean markSupported() {
            return true;
        }

        public int read() throws IOException {
            advanceIfCurrentPieceFullyRead();
            if (this.currentPiece == null) {
                return -1;
            }
            LeafByteString leafByteString = this.currentPiece;
            int i = this.currentPieceIndex;
            this.currentPieceIndex = i + 1;
            return leafByteString.byteAt(i) & 255;
        }

        public int read(byte[] bArr, int i, int i2) {
            if (bArr == null) {
                throw new NullPointerException();
            } else if (i >= 0 && i2 >= 0 && i2 <= bArr.length - i) {
                return readSkipInternal(bArr, i, i2);
            } else {
                throw new IndexOutOfBoundsException();
            }
        }

        public synchronized void reset() {
            initialize();
            readSkipInternal(null, 0, this.mark);
        }

        public long skip(long j) {
            if (j >= 0) {
                if (j > 2147483647L) {
                    j = 2147483647L;
                }
                return (long) readSkipInternal(null, 0, (int) j);
            }
            throw new IndexOutOfBoundsException();
        }
    }

    static {
        ArrayList arrayList = new ArrayList();
        int i = 1;
        int i2 = 1;
        while (i > 0) {
            arrayList.add(Integer.valueOf(i));
            int i3 = i2 + i;
            i2 = i;
            i = i3;
        }
        arrayList.add(Integer.valueOf(Integer.MAX_VALUE));
        minLengthByDepth = new int[arrayList.size()];
        for (int i4 = 0; i4 < minLengthByDepth.length; i4++) {
            minLengthByDepth[i4] = ((Integer) arrayList.get(i4)).intValue();
        }
    }

    private RopeByteString(ByteString byteString, ByteString byteString2) {
        this.left = byteString;
        this.right = byteString2;
        this.leftLength = byteString.size();
        this.totalLength = this.leftLength + byteString2.size();
        this.treeDepth = Math.max(byteString.getTreeDepth(), byteString2.getTreeDepth()) + 1;
    }

    static ByteString concatenate(ByteString byteString, ByteString byteString2) {
        if (byteString2.size() == 0) {
            return byteString;
        }
        if (byteString.size() == 0) {
            return byteString2;
        }
        int size = byteString.size() + byteString2.size();
        if (size < 128) {
            return concatenateBytes(byteString, byteString2);
        }
        if (byteString instanceof RopeByteString) {
            RopeByteString ropeByteString = (RopeByteString) byteString;
            if (ropeByteString.right.size() + byteString2.size() < 128) {
                return new RopeByteString(ropeByteString.left, concatenateBytes(ropeByteString.right, byteString2));
            } else if (ropeByteString.left.getTreeDepth() > ropeByteString.right.getTreeDepth() && ropeByteString.getTreeDepth() > byteString2.getTreeDepth()) {
                return new RopeByteString(ropeByteString.left, new RopeByteString(ropeByteString.right, byteString2));
            }
        }
        return size >= minLengthByDepth[Math.max(byteString.getTreeDepth(), byteString2.getTreeDepth()) + 1] ? new RopeByteString(byteString, byteString2) : new Balancer().balance(byteString, byteString2);
    }

    private static ByteString concatenateBytes(ByteString byteString, ByteString byteString2) {
        int size = byteString.size();
        int size2 = byteString2.size();
        byte[] bArr = new byte[(size + size2)];
        byteString.copyTo(bArr, 0, 0, size);
        byteString2.copyTo(bArr, 0, size, size2);
        return ByteString.wrap(bArr);
    }

    private boolean equalsFragments(ByteString byteString) {
        PieceIterator pieceIterator = new PieceIterator(this);
        LeafByteString leafByteString = (LeafByteString) pieceIterator.next();
        PieceIterator pieceIterator2 = new PieceIterator(byteString);
        LeafByteString leafByteString2 = (LeafByteString) pieceIterator2.next();
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        while (true) {
            int size = leafByteString.size() - i;
            int size2 = leafByteString2.size() - i2;
            int min = Math.min(size, size2);
            if (!(i == 0 ? leafByteString.equalsRange(leafByteString2, i2, min) : leafByteString2.equalsRange(leafByteString, i, min))) {
                return false;
            }
            i3 += min;
            if (i3 < this.totalLength) {
                if (min == size) {
                    leafByteString = (LeafByteString) pieceIterator.next();
                    i = 0;
                } else {
                    i += min;
                }
                if (min == size2) {
                    leafByteString2 = (LeafByteString) pieceIterator2.next();
                    i2 = 0;
                } else {
                    i2 += min;
                }
            } else if (i3 == this.totalLength) {
                return true;
            } else {
                throw new IllegalStateException();
            }
        }
    }

    static RopeByteString newInstanceForTest(ByteString byteString, ByteString byteString2) {
        return new RopeByteString(byteString, byteString2);
    }

    private void readObject(ObjectInputStream objectInputStream) throws IOException {
        throw new InvalidObjectException("RopeByteStream instances are not to be serialized directly");
    }

    public ByteBuffer asReadOnlyByteBuffer() {
        return ByteBuffer.wrap(toByteArray()).asReadOnlyBuffer();
    }

    public List<ByteBuffer> asReadOnlyByteBufferList() {
        ArrayList arrayList = new ArrayList();
        PieceIterator pieceIterator = new PieceIterator(this);
        while (pieceIterator.hasNext()) {
            arrayList.add(pieceIterator.next().asReadOnlyByteBuffer());
        }
        return arrayList;
    }

    public byte byteAt(int i) {
        checkIndex(i, this.totalLength);
        return internalByteAt(i);
    }

    public void copyTo(ByteBuffer byteBuffer) {
        this.left.copyTo(byteBuffer);
        this.right.copyTo(byteBuffer);
    }

    /* access modifiers changed from: protected */
    public void copyToInternal(byte[] bArr, int i, int i2, int i3) {
        if (i + i3 <= this.leftLength) {
            this.left.copyToInternal(bArr, i, i2, i3);
        } else if (i >= this.leftLength) {
            this.right.copyToInternal(bArr, i - this.leftLength, i2, i3);
        } else {
            int i4 = this.leftLength - i;
            this.left.copyToInternal(bArr, i, i2, i4);
            this.right.copyToInternal(bArr, 0, i2 + i4, i3 - i4);
        }
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ByteString)) {
            return false;
        }
        ByteString byteString = (ByteString) obj;
        if (this.totalLength != byteString.size()) {
            return false;
        }
        if (this.totalLength == 0) {
            return true;
        }
        int peekCachedHashCode = peekCachedHashCode();
        int peekCachedHashCode2 = byteString.peekCachedHashCode();
        if (peekCachedHashCode == 0 || peekCachedHashCode2 == 0 || peekCachedHashCode == peekCachedHashCode2) {
            return equalsFragments(byteString);
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public int getTreeDepth() {
        return this.treeDepth;
    }

    /* access modifiers changed from: 0000 */
    public byte internalByteAt(int i) {
        return i < this.leftLength ? this.left.internalByteAt(i) : this.right.internalByteAt(i - this.leftLength);
    }

    /* access modifiers changed from: protected */
    public boolean isBalanced() {
        return this.totalLength >= minLengthByDepth[this.treeDepth];
    }

    public boolean isValidUtf8() {
        return this.right.partialIsValidUtf8(this.left.partialIsValidUtf8(0, 0, this.leftLength), 0, this.right.size()) == 0;
    }

    public ByteIterator iterator() {
        return new AbstractByteIterator() {
            ByteIterator current = nextPiece();
            final PieceIterator pieces = new PieceIterator(RopeByteString.this);

            private ByteIterator nextPiece() {
                if (this.pieces.hasNext()) {
                    return this.pieces.next().iterator();
                }
                return null;
            }

            public boolean hasNext() {
                return this.current != null;
            }

            public byte nextByte() {
                if (this.current != null) {
                    byte nextByte = this.current.nextByte();
                    if (!this.current.hasNext()) {
                        this.current = nextPiece();
                    }
                    return nextByte;
                }
                throw new NoSuchElementException();
            }
        };
    }

    public CodedInputStream newCodedInput() {
        return CodedInputStream.newInstance((InputStream) new RopeInputStream());
    }

    public InputStream newInput() {
        return new RopeInputStream();
    }

    /* access modifiers changed from: protected */
    public int partialHash(int i, int i2, int i3) {
        if (i2 + i3 <= this.leftLength) {
            return this.left.partialHash(i, i2, i3);
        }
        if (i2 >= this.leftLength) {
            return this.right.partialHash(i, i2 - this.leftLength, i3);
        }
        int i4 = this.leftLength - i2;
        return this.right.partialHash(this.left.partialHash(i, i2, i4), 0, i3 - i4);
    }

    /* access modifiers changed from: protected */
    public int partialIsValidUtf8(int i, int i2, int i3) {
        if (i2 + i3 <= this.leftLength) {
            return this.left.partialIsValidUtf8(i, i2, i3);
        }
        if (i2 >= this.leftLength) {
            return this.right.partialIsValidUtf8(i, i2 - this.leftLength, i3);
        }
        int i4 = this.leftLength - i2;
        return this.right.partialIsValidUtf8(this.left.partialIsValidUtf8(i, i2, i4), 0, i3 - i4);
    }

    public int size() {
        return this.totalLength;
    }

    public ByteString substring(int i, int i2) {
        int checkRange = checkRange(i, i2, this.totalLength);
        return checkRange == 0 ? ByteString.EMPTY : checkRange == this.totalLength ? this : i2 <= this.leftLength ? this.left.substring(i, i2) : i >= this.leftLength ? this.right.substring(i - this.leftLength, i2 - this.leftLength) : new RopeByteString(this.left.substring(i), this.right.substring(0, i2 - this.leftLength));
    }

    /* access modifiers changed from: protected */
    public String toStringInternal(Charset charset) {
        return new String(toByteArray(), charset);
    }

    /* access modifiers changed from: 0000 */
    public Object writeReplace() {
        return ByteString.wrap(toByteArray());
    }

    /* access modifiers changed from: 0000 */
    public void writeTo(ByteOutput byteOutput) throws IOException {
        this.left.writeTo(byteOutput);
        this.right.writeTo(byteOutput);
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        this.left.writeTo(outputStream);
        this.right.writeTo(outputStream);
    }

    /* access modifiers changed from: 0000 */
    public void writeToInternal(OutputStream outputStream, int i, int i2) throws IOException {
        if (i + i2 <= this.leftLength) {
            this.left.writeToInternal(outputStream, i, i2);
        } else if (i >= this.leftLength) {
            this.right.writeToInternal(outputStream, i - this.leftLength, i2);
        } else {
            int i3 = this.leftLength - i;
            this.left.writeToInternal(outputStream, i, i3);
            this.right.writeToInternal(outputStream, 0, i2 - i3);
        }
    }
}
