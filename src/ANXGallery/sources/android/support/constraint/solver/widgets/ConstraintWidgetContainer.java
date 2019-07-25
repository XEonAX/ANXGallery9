package android.support.constraint.solver.widgets;

import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ConstraintWidgetContainer extends WidgetContainer {
    int mDebugSolverPassCount = 0;
    public boolean mGroupsWrapOptimized = false;
    private boolean mHeightMeasuredTooSmall = false;
    ChainHead[] mHorizontalChainsArray = new ChainHead[4];
    int mHorizontalChainsSize = 0;
    public boolean mHorizontalWrapOptimized = false;
    private boolean mIsRtl = false;
    private int mOptimizationLevel = 7;
    int mPaddingBottom;
    int mPaddingLeft;
    int mPaddingRight;
    int mPaddingTop;
    public boolean mSkipSolver = false;
    private Snapshot mSnapshot;
    protected LinearSystem mSystem = new LinearSystem();
    ChainHead[] mVerticalChainsArray = new ChainHead[4];
    int mVerticalChainsSize = 0;
    public boolean mVerticalWrapOptimized = false;
    public List<ConstraintWidgetGroup> mWidgetGroups = new ArrayList();
    private boolean mWidthMeasuredTooSmall = false;
    public int mWrapFixedHeight = 0;
    public int mWrapFixedWidth = 0;

    private void addHorizontalChain(ConstraintWidget constraintWidget) {
        if (this.mHorizontalChainsSize + 1 >= this.mHorizontalChainsArray.length) {
            this.mHorizontalChainsArray = (ChainHead[]) Arrays.copyOf(this.mHorizontalChainsArray, this.mHorizontalChainsArray.length * 2);
        }
        this.mHorizontalChainsArray[this.mHorizontalChainsSize] = new ChainHead(constraintWidget, 0, isRtl());
        this.mHorizontalChainsSize++;
    }

    private void addVerticalChain(ConstraintWidget constraintWidget) {
        if (this.mVerticalChainsSize + 1 >= this.mVerticalChainsArray.length) {
            this.mVerticalChainsArray = (ChainHead[]) Arrays.copyOf(this.mVerticalChainsArray, this.mVerticalChainsArray.length * 2);
        }
        this.mVerticalChainsArray[this.mVerticalChainsSize] = new ChainHead(constraintWidget, 1, isRtl());
        this.mVerticalChainsSize++;
    }

    private void resetChains() {
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
    }

    /* access modifiers changed from: 0000 */
    public void addChain(ConstraintWidget constraintWidget, int i) {
        if (i == 0) {
            addHorizontalChain(constraintWidget);
        } else if (i == 1) {
            addVerticalChain(constraintWidget);
        }
    }

    public boolean addChildrenToSolver(LinearSystem linearSystem) {
        addToSolver(linearSystem);
        int size = this.mChildren.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mChildren.get(i);
            if (constraintWidget instanceof ConstraintWidgetContainer) {
                DimensionBehaviour dimensionBehaviour = constraintWidget.mListDimensionBehaviors[0];
                DimensionBehaviour dimensionBehaviour2 = constraintWidget.mListDimensionBehaviors[1];
                if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
                }
                if (dimensionBehaviour2 == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
                }
                constraintWidget.addToSolver(linearSystem);
                if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setHorizontalDimensionBehaviour(dimensionBehaviour);
                }
                if (dimensionBehaviour2 == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setVerticalDimensionBehaviour(dimensionBehaviour2);
                }
            } else {
                Optimizer.checkMatchParent(this, linearSystem, constraintWidget);
                constraintWidget.addToSolver(linearSystem);
            }
        }
        if (this.mHorizontalChainsSize > 0) {
            Chain.applyChainConstraints(this, linearSystem, 0);
        }
        if (this.mVerticalChainsSize > 0) {
            Chain.applyChainConstraints(this, linearSystem, 1);
        }
        return true;
    }

    public void analyze(int i) {
        super.analyze(i);
        int size = this.mChildren.size();
        for (int i2 = 0; i2 < size; i2++) {
            ((ConstraintWidget) this.mChildren.get(i2)).analyze(i);
        }
    }

    public int getOptimizationLevel() {
        return this.mOptimizationLevel;
    }

    public boolean handlesInternalConstraints() {
        return false;
    }

    public boolean isHeightMeasuredTooSmall() {
        return this.mHeightMeasuredTooSmall;
    }

    public boolean isRtl() {
        return this.mIsRtl;
    }

    public boolean isWidthMeasuredTooSmall() {
        return this.mWidthMeasuredTooSmall;
    }

    /* JADX WARNING: type inference failed for: r8v15, types: [boolean] */
    /* JADX WARNING: type inference failed for: r8v16 */
    /* JADX WARNING: type inference failed for: r8v17 */
    /* JADX WARNING: type inference failed for: r8v48 */
    /* JADX WARNING: type inference failed for: r8v49 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r8v15, types: [boolean]
  assigns: []
  uses: [?[int, short, byte, char], boolean]
  mth insns count: 345
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:107:0x0269  */
    /* JADX WARNING: Removed duplicated region for block: B:110:0x0285  */
    /* JADX WARNING: Removed duplicated region for block: B:111:0x0292  */
    /* JADX WARNING: Removed duplicated region for block: B:113:0x0295  */
    /* JADX WARNING: Removed duplicated region for block: B:69:0x0188  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x0191  */
    /* JADX WARNING: Removed duplicated region for block: B:85:0x01dc  */
    /* JADX WARNING: Unknown variable types count: 3 */
    public void layout() {
        int i;
        int i2;
        boolean z;
        boolean z2;
        char c;
        int i3;
        boolean z3;
        int max;
        int max2;
        ? r8;
        boolean z4;
        int i4 = this.mX;
        int i5 = this.mY;
        int max3 = Math.max(0, getWidth());
        int max4 = Math.max(0, getHeight());
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        if (this.mParent != null) {
            if (this.mSnapshot == null) {
                this.mSnapshot = new Snapshot(this);
            }
            this.mSnapshot.updateFrom(this);
            setX(this.mPaddingLeft);
            setY(this.mPaddingTop);
            resetAnchors();
            resetSolverVariables(this.mSystem.getCache());
        } else {
            this.mX = 0;
            this.mY = 0;
        }
        int i6 = 32;
        if (this.mOptimizationLevel != 0) {
            if (!optimizeFor(8)) {
                optimizeReset();
            }
            if (!optimizeFor(32)) {
                optimize();
            }
            this.mSystem.graphOptimizer = true;
        } else {
            this.mSystem.graphOptimizer = false;
        }
        DimensionBehaviour dimensionBehaviour = this.mListDimensionBehaviors[1];
        DimensionBehaviour dimensionBehaviour2 = this.mListDimensionBehaviors[0];
        resetChains();
        if (this.mWidgetGroups.size() == 0) {
            this.mWidgetGroups.clear();
            this.mWidgetGroups.add(0, new ConstraintWidgetGroup(this.mChildren));
        }
        int size = this.mWidgetGroups.size();
        ArrayList arrayList = this.mChildren;
        boolean z5 = getHorizontalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT || getVerticalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT;
        boolean z6 = false;
        int i7 = 0;
        while (i7 < size && !this.mSkipSolver) {
            if (((ConstraintWidgetGroup) this.mWidgetGroups.get(i7)).mSkipSolver) {
                i = size;
            } else {
                if (optimizeFor(i6)) {
                    if (getHorizontalDimensionBehaviour() == DimensionBehaviour.FIXED && getVerticalDimensionBehaviour() == DimensionBehaviour.FIXED) {
                        this.mChildren = (ArrayList) ((ConstraintWidgetGroup) this.mWidgetGroups.get(i7)).getWidgetsToSolve();
                    } else {
                        this.mChildren = (ArrayList) ((ConstraintWidgetGroup) this.mWidgetGroups.get(i7)).mConstrainedGroup;
                    }
                }
                resetChains();
                int size2 = this.mChildren.size();
                for (int i8 = 0; i8 < size2; i8++) {
                    ConstraintWidget constraintWidget = (ConstraintWidget) this.mChildren.get(i8);
                    if (constraintWidget instanceof WidgetContainer) {
                        ((WidgetContainer) constraintWidget).layout();
                    }
                }
                boolean z7 = z6;
                int i9 = 0;
                boolean z8 = true;
                while (z8) {
                    boolean z9 = z8;
                    int i10 = i9 + 1;
                    try {
                        this.mSystem.reset();
                        resetChains();
                        createObjectVariables(this.mSystem);
                        int i11 = 0;
                        while (i11 < size2) {
                            z2 = z7;
                            try {
                                ((ConstraintWidget) this.mChildren.get(i11)).createObjectVariables(this.mSystem);
                                i11++;
                                z7 = z2;
                            } catch (Exception e) {
                                e = e;
                                z4 = z9;
                                e.printStackTrace();
                                PrintStream printStream = System.out;
                                z = z4;
                                StringBuilder sb = new StringBuilder();
                                i2 = size;
                                sb.append("EXCEPTION : ");
                                sb.append(e);
                                printStream.println(sb.toString());
                                if (z) {
                                }
                                c = 2;
                                if (z5) {
                                }
                                i3 = i10;
                                z7 = z2;
                                z3 = false;
                                max = Math.max(this.mMinWidth, getWidth());
                                if (max > getWidth()) {
                                }
                                max2 = Math.max(this.mMinHeight, getHeight());
                                if (max2 <= getHeight()) {
                                }
                                if (!z7) {
                                }
                                z8 = z3;
                                size = i2;
                                i9 = i3;
                            }
                        }
                        z2 = z7;
                        z4 = addChildrenToSolver(this.mSystem);
                        if (z4) {
                            try {
                                this.mSystem.minimize();
                            } catch (Exception e2) {
                                e = e2;
                            }
                        }
                        z = z4;
                        i2 = size;
                    } catch (Exception e3) {
                        e = e3;
                        z2 = z7;
                        z4 = z9;
                        e.printStackTrace();
                        PrintStream printStream2 = System.out;
                        z = z4;
                        StringBuilder sb2 = new StringBuilder();
                        i2 = size;
                        sb2.append("EXCEPTION : ");
                        sb2.append(e);
                        printStream2.println(sb2.toString());
                        if (z) {
                        }
                        c = 2;
                        if (z5) {
                        }
                        i3 = i10;
                        z7 = z2;
                        z3 = false;
                        max = Math.max(this.mMinWidth, getWidth());
                        if (max > getWidth()) {
                        }
                        max2 = Math.max(this.mMinHeight, getHeight());
                        if (max2 <= getHeight()) {
                        }
                        if (!z7) {
                        }
                        z8 = z3;
                        size = i2;
                        i9 = i3;
                    }
                    if (z) {
                        updateChildrenFromSolver(this.mSystem, Optimizer.flags);
                    } else {
                        updateFromSolver(this.mSystem);
                        int i12 = 0;
                        while (true) {
                            if (i12 >= size2) {
                                break;
                            }
                            ConstraintWidget constraintWidget2 = (ConstraintWidget) this.mChildren.get(i12);
                            if (constraintWidget2.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT || constraintWidget2.getWidth() >= constraintWidget2.getWrapWidth()) {
                                if (constraintWidget2.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget2.getHeight() < constraintWidget2.getWrapHeight()) {
                                    c = 2;
                                    Optimizer.flags[2] = true;
                                    break;
                                }
                                i12++;
                            } else {
                                Optimizer.flags[2] = true;
                                break;
                            }
                        }
                        if (z5 || i10 >= 8 || !Optimizer.flags[c]) {
                            i3 = i10;
                            z7 = z2;
                            z3 = false;
                        } else {
                            int i13 = 0;
                            int i14 = 0;
                            int i15 = 0;
                            while (i13 < size2) {
                                ConstraintWidget constraintWidget3 = (ConstraintWidget) this.mChildren.get(i13);
                                int i16 = i10;
                                i14 = Math.max(i14, constraintWidget3.mX + constraintWidget3.getWidth());
                                i15 = Math.max(i15, constraintWidget3.mY + constraintWidget3.getHeight());
                                i13++;
                                i10 = i16;
                            }
                            i3 = i10;
                            int max5 = Math.max(this.mMinWidth, i14);
                            int max6 = Math.max(this.mMinHeight, i15);
                            if (dimensionBehaviour2 != DimensionBehaviour.WRAP_CONTENT || getWidth() >= max5) {
                                z3 = false;
                            } else {
                                setWidth(max5);
                                this.mListDimensionBehaviors[0] = DimensionBehaviour.WRAP_CONTENT;
                                z3 = true;
                                z2 = true;
                            }
                            if (dimensionBehaviour != DimensionBehaviour.WRAP_CONTENT || getHeight() >= max6) {
                                z7 = z2;
                            } else {
                                setHeight(max6);
                                this.mListDimensionBehaviors[1] = DimensionBehaviour.WRAP_CONTENT;
                                z3 = true;
                                z7 = true;
                            }
                        }
                        max = Math.max(this.mMinWidth, getWidth());
                        if (max > getWidth()) {
                            setWidth(max);
                            this.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                            z3 = true;
                            z7 = true;
                        }
                        max2 = Math.max(this.mMinHeight, getHeight());
                        if (max2 <= getHeight()) {
                            setHeight(max2);
                            this.mListDimensionBehaviors[1] = DimensionBehaviour.FIXED;
                            z3 = true;
                            z7 = true;
                            r8 = 1;
                        } else {
                            r8 = 1;
                        }
                        if (!z7) {
                            if (this.mListDimensionBehaviors[0] == DimensionBehaviour.WRAP_CONTENT && max3 > 0 && getWidth() > max3) {
                                this.mWidthMeasuredTooSmall = r8;
                                this.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                                setWidth(max3);
                                z3 = true;
                                z7 = true;
                            }
                            if (this.mListDimensionBehaviors[r8] == DimensionBehaviour.WRAP_CONTENT && max4 > 0 && getHeight() > max4) {
                                this.mHeightMeasuredTooSmall = r8;
                                this.mListDimensionBehaviors[r8] = DimensionBehaviour.FIXED;
                                setHeight(max4);
                                z8 = true;
                                z7 = true;
                                size = i2;
                                i9 = i3;
                            }
                        }
                        z8 = z3;
                        size = i2;
                        i9 = i3;
                    }
                    c = 2;
                    if (z5) {
                    }
                    i3 = i10;
                    z7 = z2;
                    z3 = false;
                    max = Math.max(this.mMinWidth, getWidth());
                    if (max > getWidth()) {
                    }
                    max2 = Math.max(this.mMinHeight, getHeight());
                    if (max2 <= getHeight()) {
                    }
                    if (!z7) {
                    }
                    z8 = z3;
                    size = i2;
                    i9 = i3;
                }
                boolean z10 = z7;
                i = size;
                ((ConstraintWidgetGroup) this.mWidgetGroups.get(i7)).updateUnresolvedWidgets();
                z6 = z10;
            }
            i7++;
            size = i;
            i6 = 32;
        }
        this.mChildren = arrayList;
        if (this.mParent != null) {
            int max7 = Math.max(this.mMinWidth, getWidth());
            int max8 = Math.max(this.mMinHeight, getHeight());
            this.mSnapshot.applyTo(this);
            setWidth(max7 + this.mPaddingLeft + this.mPaddingRight);
            setHeight(max8 + this.mPaddingTop + this.mPaddingBottom);
        } else {
            this.mX = i4;
            this.mY = i5;
        }
        if (z6) {
            this.mListDimensionBehaviors[0] = dimensionBehaviour2;
            this.mListDimensionBehaviors[1] = dimensionBehaviour;
        }
        resetSolverVariables(this.mSystem.getCache());
        if (this == getRootConstraintContainer()) {
            updateDrawPosition();
        }
    }

    public void optimize() {
        if (!optimizeFor(8)) {
            analyze(this.mOptimizationLevel);
        }
        solveGraph();
    }

    public boolean optimizeFor(int i) {
        return (this.mOptimizationLevel & i) == i;
    }

    public void optimizeForDimensions(int i, int i2) {
        if (!(this.mListDimensionBehaviors[0] == DimensionBehaviour.WRAP_CONTENT || this.mResolutionWidth == null)) {
            this.mResolutionWidth.resolve(i);
        }
        if (this.mListDimensionBehaviors[1] != DimensionBehaviour.WRAP_CONTENT && this.mResolutionHeight != null) {
            this.mResolutionHeight.resolve(i2);
        }
    }

    public void optimizeReset() {
        int size = this.mChildren.size();
        resetResolutionNodes();
        for (int i = 0; i < size; i++) {
            ((ConstraintWidget) this.mChildren.get(i)).resetResolutionNodes();
        }
    }

    public void preOptimize() {
        optimizeReset();
        analyze(this.mOptimizationLevel);
    }

    public void reset() {
        this.mSystem.reset();
        this.mPaddingLeft = 0;
        this.mPaddingRight = 0;
        this.mPaddingTop = 0;
        this.mPaddingBottom = 0;
        this.mWidgetGroups.clear();
        this.mSkipSolver = false;
        super.reset();
    }

    public void setOptimizationLevel(int i) {
        this.mOptimizationLevel = i;
    }

    public void setRtl(boolean z) {
        this.mIsRtl = z;
    }

    public void solveGraph() {
        ResolutionAnchor resolutionNode = getAnchor(Type.LEFT).getResolutionNode();
        ResolutionAnchor resolutionNode2 = getAnchor(Type.TOP).getResolutionNode();
        resolutionNode.resolve(null, 0.0f);
        resolutionNode2.resolve(null, 0.0f);
    }

    public void updateChildrenFromSolver(LinearSystem linearSystem, boolean[] zArr) {
        zArr[2] = false;
        updateFromSolver(linearSystem);
        int size = this.mChildren.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mChildren.get(i);
            constraintWidget.updateFromSolver(linearSystem);
            if (constraintWidget.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget.getWidth() < constraintWidget.getWrapWidth()) {
                zArr[2] = true;
            }
            if (constraintWidget.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget.getHeight() < constraintWidget.getWrapHeight()) {
                zArr[2] = true;
            }
        }
    }
}
