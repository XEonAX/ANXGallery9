package com.miui.gallery.editor.blocksdk;

import java.util.ArrayList;
import java.util.List;

public class SplitUtils {
    public static List<Block> split(int i, int i2) {
        ArrayList arrayList = new ArrayList();
        int i3 = i * i2;
        int i4 = i3 % 6000000 == 0 ? i3 / 6000000 : (i3 / 6000000) + 1;
        int i5 = i2 / i4;
        for (int i6 = 0; i6 < i4; i6++) {
            Block block = new Block();
            block.totalHeight = i2;
            block.mWidth = i;
            if (i6 == i4 - 1) {
                block.mHeight = (i2 % i4) + i5;
            } else {
                block.mHeight = i5;
            }
            block.mStatus = 1;
            block.mOffset = i6 * i5 * i;
            arrayList.add(block);
        }
        return arrayList;
    }
}
