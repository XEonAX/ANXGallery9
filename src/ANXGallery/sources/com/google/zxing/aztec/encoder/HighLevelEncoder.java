package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;

public final class HighLevelEncoder {
    private static final int[][] CHAR_MAP = ((int[][]) Array.newInstance(int.class, new int[]{5, 256}));
    static final int[][] LATCH_TABLE;
    static final String[] MODE_NAMES = {"UPPER", "LOWER", "DIGIT", "MIXED", "PUNCT"};
    static final int[][] SHIFT_TABLE = ((int[][]) Array.newInstance(int.class, new int[]{6, 6}));
    private final byte[] text;

    static {
        int[] iArr = new int[5];
        iArr[1] = 327708;
        iArr[2] = 327710;
        iArr[3] = 327709;
        iArr[4] = 656318;
        int[] iArr2 = new int[5];
        iArr2[0] = 590318;
        iArr2[2] = 327710;
        iArr2[3] = 327709;
        iArr2[4] = 656318;
        int[] iArr3 = new int[5];
        iArr3[0] = 262158;
        iArr3[1] = 590300;
        iArr3[3] = 590301;
        iArr3[4] = 932798;
        int[] iArr4 = new int[5];
        iArr4[0] = 327709;
        iArr4[1] = 327708;
        iArr4[2] = 656318;
        iArr4[4] = 327710;
        int[] iArr5 = new int[5];
        iArr5[0] = 327711;
        iArr5[1] = 656380;
        iArr5[2] = 656382;
        iArr5[3] = 656381;
        LATCH_TABLE = new int[][]{iArr, iArr2, iArr3, iArr4, iArr5};
        CHAR_MAP[0][32] = 1;
        for (int i = 65; i <= 90; i++) {
            CHAR_MAP[0][i] = (i - 65) + 2;
        }
        CHAR_MAP[1][32] = 1;
        for (int i2 = 97; i2 <= 122; i2++) {
            CHAR_MAP[1][i2] = (i2 - 97) + 2;
        }
        CHAR_MAP[2][32] = 1;
        for (int i3 = 48; i3 <= 57; i3++) {
            CHAR_MAP[2][i3] = (i3 - 48) + 2;
        }
        CHAR_MAP[2][44] = 12;
        CHAR_MAP[2][46] = 13;
        int[] iArr6 = new int[28];
        iArr6[1] = 32;
        iArr6[2] = 1;
        iArr6[3] = 2;
        iArr6[4] = 3;
        iArr6[5] = 4;
        iArr6[6] = 5;
        iArr6[7] = 6;
        iArr6[8] = 7;
        iArr6[9] = 8;
        iArr6[10] = 9;
        iArr6[11] = 10;
        iArr6[12] = 11;
        iArr6[13] = 12;
        iArr6[14] = 13;
        iArr6[15] = 27;
        iArr6[16] = 28;
        iArr6[17] = 29;
        iArr6[18] = 30;
        iArr6[19] = 31;
        iArr6[20] = 64;
        iArr6[21] = 92;
        iArr6[22] = 94;
        iArr6[23] = 95;
        iArr6[24] = 96;
        iArr6[25] = 124;
        iArr6[26] = 126;
        iArr6[27] = 127;
        for (int i4 = 0; i4 < iArr6.length; i4++) {
            CHAR_MAP[3][iArr6[i4]] = i4;
        }
        int[] iArr7 = new int[31];
        iArr7[1] = 13;
        iArr7[6] = 33;
        iArr7[7] = 39;
        iArr7[8] = 35;
        iArr7[9] = 36;
        iArr7[10] = 37;
        iArr7[11] = 38;
        iArr7[12] = 39;
        iArr7[13] = 40;
        iArr7[14] = 41;
        iArr7[15] = 42;
        iArr7[16] = 43;
        iArr7[17] = 44;
        iArr7[18] = 45;
        iArr7[19] = 46;
        iArr7[20] = 47;
        iArr7[21] = 58;
        iArr7[22] = 59;
        iArr7[23] = 60;
        iArr7[24] = 61;
        iArr7[25] = 62;
        iArr7[26] = 63;
        iArr7[27] = 91;
        iArr7[28] = 93;
        iArr7[29] = 123;
        iArr7[30] = 125;
        for (int i5 = 0; i5 < iArr7.length; i5++) {
            if (iArr7[i5] > 0) {
                CHAR_MAP[4][iArr7[i5]] = i5;
            }
        }
        for (int[] fill : SHIFT_TABLE) {
            Arrays.fill(fill, -1);
        }
        SHIFT_TABLE[0][4] = 0;
        SHIFT_TABLE[1][4] = 0;
        SHIFT_TABLE[1][0] = 28;
        SHIFT_TABLE[3][4] = 0;
        SHIFT_TABLE[2][4] = 0;
        SHIFT_TABLE[2][0] = 15;
    }

    public HighLevelEncoder(byte[] bArr) {
        this.text = bArr;
    }

    private static Collection<State> simplifyStates(Iterable<State> iterable) {
        LinkedList linkedList = new LinkedList();
        for (State state : iterable) {
            boolean z = true;
            Iterator it = linkedList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                State state2 = (State) it.next();
                if (state2.isBetterThanOrEqualTo(state)) {
                    z = false;
                    break;
                } else if (state.isBetterThanOrEqualTo(state2)) {
                    it.remove();
                }
            }
            if (z) {
                linkedList.add(state);
            }
        }
        return linkedList;
    }

    private void updateStateForChar(State state, int i, Collection<State> collection) {
        char c = (char) (this.text[i] & 255);
        boolean z = CHAR_MAP[state.getMode()][c] > 0;
        State state2 = null;
        for (int i2 = 0; i2 <= 4; i2++) {
            int i3 = CHAR_MAP[i2][c];
            if (i3 > 0) {
                if (state2 == null) {
                    state2 = state.endBinaryShift(i);
                }
                if (!z || i2 == state.getMode() || i2 == 2) {
                    collection.add(state2.latchAndAppend(i2, i3));
                }
                if (!z && SHIFT_TABLE[state.getMode()][i2] >= 0) {
                    collection.add(state2.shiftAndAppend(i2, i3));
                }
            }
        }
        if (state.getBinaryShiftByteCount() > 0 || CHAR_MAP[state.getMode()][c] == 0) {
            collection.add(state.addBinaryShiftChar(i));
        }
    }

    private static void updateStateForPair(State state, int i, int i2, Collection<State> collection) {
        State endBinaryShift = state.endBinaryShift(i);
        collection.add(endBinaryShift.latchAndAppend(4, i2));
        if (state.getMode() != 4) {
            collection.add(endBinaryShift.shiftAndAppend(4, i2));
        }
        if (i2 == 3 || i2 == 4) {
            collection.add(endBinaryShift.latchAndAppend(2, 16 - i2).latchAndAppend(2, 1));
        }
        if (state.getBinaryShiftByteCount() > 0) {
            collection.add(state.addBinaryShiftChar(i).addBinaryShiftChar(i + 1));
        }
    }

    private Collection<State> updateStateListForChar(Iterable<State> iterable, int i) {
        LinkedList linkedList = new LinkedList();
        for (State updateStateForChar : iterable) {
            updateStateForChar(updateStateForChar, i, linkedList);
        }
        return simplifyStates(linkedList);
    }

    private static Collection<State> updateStateListForPair(Iterable<State> iterable, int i, int i2) {
        LinkedList linkedList = new LinkedList();
        for (State updateStateForPair : iterable) {
            updateStateForPair(updateStateForPair, i, i2, linkedList);
        }
        return simplifyStates(linkedList);
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0058  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x005f  */
    public BitArray encode() {
        int i;
        Collection singletonList = Collections.singletonList(State.INITIAL_STATE);
        int i2 = 0;
        while (i2 < this.text.length) {
            int i3 = i2 + 1;
            byte b = i3 < this.text.length ? this.text[i3] : 0;
            byte b2 = this.text[i2];
            if (b2 != 13) {
                if (b2 != 44) {
                    if (b2 != 46) {
                        if (b2 == 58 && b == 32) {
                            i = 5;
                            if (i > 0) {
                                singletonList = updateStateListForPair(singletonList, i2, i);
                                i2 = i3;
                            } else {
                                singletonList = updateStateListForChar(singletonList, i2);
                            }
                            i2++;
                        }
                    } else if (b == 32) {
                        i = 3;
                        if (i > 0) {
                        }
                        i2++;
                    }
                } else if (b == 32) {
                    i = 4;
                    if (i > 0) {
                    }
                    i2++;
                }
            } else if (b == 10) {
                i = 2;
                if (i > 0) {
                }
                i2++;
            }
            i = 0;
            if (i > 0) {
            }
            i2++;
        }
        return ((State) Collections.min(singletonList, new Comparator<State>() {
            public int compare(State state, State state2) {
                return state.getBitCount() - state2.getBitCount();
            }
        })).toBitArray(this.text);
    }
}
