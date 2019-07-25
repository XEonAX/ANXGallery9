package android.support.constraint.solver.widgets;

import android.support.constraint.solver.Cache;
import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.Metrics;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintAnchor.Strength;
import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import java.util.ArrayList;

public class ConstraintWidget {
    public static float DEFAULT_BIAS = 0.5f;
    protected ArrayList<ConstraintAnchor> mAnchors = new ArrayList<>();
    ConstraintAnchor mBaseline = new ConstraintAnchor(this, Type.BASELINE);
    int mBaselineDistance = 0;
    ConstraintWidgetGroup mBelongingGroup = null;
    ConstraintAnchor mBottom = new ConstraintAnchor(this, Type.BOTTOM);
    ConstraintAnchor mCenter = new ConstraintAnchor(this, Type.CENTER);
    ConstraintAnchor mCenterX = new ConstraintAnchor(this, Type.CENTER_X);
    ConstraintAnchor mCenterY = new ConstraintAnchor(this, Type.CENTER_Y);
    private float mCircleConstraintAngle = 0.0f;
    private Object mCompanionWidget;
    private int mContainerItemSkip = 0;
    private String mDebugName = null;
    protected float mDimensionRatio = 0.0f;
    protected int mDimensionRatioSide = -1;
    private int mDrawHeight = 0;
    private int mDrawWidth = 0;
    private int mDrawX = 0;
    private int mDrawY = 0;
    boolean mGroupsToSolver = false;
    int mHeight = 0;
    float mHorizontalBiasPercent = DEFAULT_BIAS;
    boolean mHorizontalChainFixedPosition;
    int mHorizontalChainStyle = 0;
    ConstraintWidget mHorizontalNextWidget = null;
    public int mHorizontalResolution = -1;
    boolean mHorizontalWrapVisited;
    boolean mIsHeightWrapContent;
    boolean mIsWidthWrapContent;
    ConstraintAnchor mLeft = new ConstraintAnchor(this, Type.LEFT);
    protected ConstraintAnchor[] mListAnchors = {this.mLeft, this.mRight, this.mTop, this.mBottom, this.mBaseline, this.mCenter};
    protected DimensionBehaviour[] mListDimensionBehaviors = {DimensionBehaviour.FIXED, DimensionBehaviour.FIXED};
    protected ConstraintWidget[] mListNextMatchConstraintsWidget = {null, null};
    int mMatchConstraintDefaultHeight = 0;
    int mMatchConstraintDefaultWidth = 0;
    int mMatchConstraintMaxHeight = 0;
    int mMatchConstraintMaxWidth = 0;
    int mMatchConstraintMinHeight = 0;
    int mMatchConstraintMinWidth = 0;
    float mMatchConstraintPercentHeight = 1.0f;
    float mMatchConstraintPercentWidth = 1.0f;
    private int[] mMaxDimension = {Integer.MAX_VALUE, Integer.MAX_VALUE};
    protected int mMinHeight;
    protected int mMinWidth;
    protected ConstraintWidget[] mNextChainWidget = {null, null};
    protected int mOffsetX = 0;
    protected int mOffsetY = 0;
    boolean mOptimizerMeasurable = false;
    boolean mOptimizerMeasured = false;
    ConstraintWidget mParent = null;
    int mRelX = 0;
    int mRelY = 0;
    ResolutionDimension mResolutionHeight;
    ResolutionDimension mResolutionWidth;
    float mResolvedDimensionRatio = 1.0f;
    int mResolvedDimensionRatioSide = -1;
    int[] mResolvedMatchConstraintDefault = new int[2];
    ConstraintAnchor mRight = new ConstraintAnchor(this, Type.RIGHT);
    ConstraintAnchor mTop = new ConstraintAnchor(this, Type.TOP);
    private String mType = null;
    float mVerticalBiasPercent = DEFAULT_BIAS;
    boolean mVerticalChainFixedPosition;
    int mVerticalChainStyle = 0;
    ConstraintWidget mVerticalNextWidget = null;
    public int mVerticalResolution = -1;
    boolean mVerticalWrapVisited;
    private int mVisibility = 0;
    float[] mWeight = {-1.0f, -1.0f};
    int mWidth = 0;
    private int mWrapHeight;
    private int mWrapWidth;
    protected int mX = 0;
    protected int mY = 0;

    public enum DimensionBehaviour {
        FIXED,
        WRAP_CONTENT,
        MATCH_CONSTRAINT,
        MATCH_PARENT
    }

    public ConstraintWidget() {
        addAnchors();
    }

    private void addAnchors() {
        this.mAnchors.add(this.mLeft);
        this.mAnchors.add(this.mTop);
        this.mAnchors.add(this.mRight);
        this.mAnchors.add(this.mBottom);
        this.mAnchors.add(this.mCenterX);
        this.mAnchors.add(this.mCenterY);
        this.mAnchors.add(this.mCenter);
        this.mAnchors.add(this.mBaseline);
    }

    /* JADX WARNING: Removed duplicated region for block: B:101:0x01ce  */
    /* JADX WARNING: Removed duplicated region for block: B:157:0x0288  */
    /* JADX WARNING: Removed duplicated region for block: B:164:0x02cf  */
    /* JADX WARNING: Removed duplicated region for block: B:168:0x02e1  */
    /* JADX WARNING: Removed duplicated region for block: B:169:0x02e4  */
    /* JADX WARNING: Removed duplicated region for block: B:179:0x0306  */
    /* JADX WARNING: Removed duplicated region for block: B:181:0x030d  */
    /* JADX WARNING: Removed duplicated region for block: B:183:0x0313  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00d9  */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x0100  */
    /* JADX WARNING: Removed duplicated region for block: B:89:0x01a6  */
    /* JADX WARNING: Removed duplicated region for block: B:99:0x01c8  */
    private void applyConstraints(LinearSystem linearSystem, boolean z, SolverVariable solverVariable, SolverVariable solverVariable2, DimensionBehaviour dimensionBehaviour, boolean z2, ConstraintAnchor constraintAnchor, ConstraintAnchor constraintAnchor2, int i, int i2, int i3, int i4, float f, boolean z3, boolean z4, int i5, int i6, int i7, float f2, boolean z5) {
        boolean z6;
        int i8;
        boolean z7;
        int i9;
        int i10;
        SolverVariable solverVariable3;
        int i11;
        int i12;
        SolverVariable solverVariable4;
        int i13;
        SolverVariable solverVariable5;
        SolverVariable solverVariable6;
        int i14;
        int i15;
        SolverVariable solverVariable7;
        int i16;
        int i17;
        SolverVariable solverVariable8;
        boolean z8;
        int i18;
        SolverVariable solverVariable9;
        boolean z9;
        int i19;
        SolverVariable solverVariable10;
        SolverVariable solverVariable11;
        SolverVariable solverVariable12;
        SolverVariable solverVariable13;
        int i20;
        boolean z10;
        boolean z11;
        int i21;
        int i22;
        boolean z12;
        boolean z13;
        boolean z14;
        int i23;
        int i24;
        int i25;
        SolverVariable solverVariable14;
        SolverVariable solverVariable15;
        int i26;
        LinearSystem linearSystem2 = linearSystem;
        SolverVariable solverVariable16 = solverVariable;
        SolverVariable solverVariable17 = solverVariable2;
        ConstraintAnchor constraintAnchor3 = constraintAnchor2;
        int i27 = i3;
        int i28 = i4;
        SolverVariable createObjectVariable = linearSystem2.createObjectVariable(constraintAnchor);
        SolverVariable createObjectVariable2 = linearSystem2.createObjectVariable(constraintAnchor3);
        SolverVariable createObjectVariable3 = linearSystem2.createObjectVariable(constraintAnchor.getTarget());
        SolverVariable createObjectVariable4 = linearSystem2.createObjectVariable(constraintAnchor2.getTarget());
        if (linearSystem2.graphOptimizer && constraintAnchor.getResolutionNode().state == 1 && constraintAnchor2.getResolutionNode().state == 1) {
            if (LinearSystem.getMetrics() != null) {
                Metrics metrics = LinearSystem.getMetrics();
                metrics.resolvedWidgets++;
            }
            constraintAnchor.getResolutionNode().addResolvedValue(linearSystem2);
            constraintAnchor2.getResolutionNode().addResolvedValue(linearSystem2);
            if (!z4 && z) {
                linearSystem2.addGreaterThan(solverVariable17, createObjectVariable2, 0, 6);
            }
            return;
        }
        if (LinearSystem.getMetrics() != null) {
            Metrics metrics2 = LinearSystem.getMetrics();
            metrics2.nonresolvedWidgets++;
        }
        boolean isConnected = constraintAnchor.isConnected();
        boolean isConnected2 = constraintAnchor2.isConnected();
        boolean isConnected3 = this.mCenter.isConnected();
        int i29 = isConnected ? 1 : 0;
        if (isConnected2) {
            i29++;
        }
        if (isConnected3) {
            i29++;
        }
        SolverVariable solverVariable18 = createObjectVariable4;
        int i30 = z3 ? 3 : i5;
        switch (dimensionBehaviour) {
            case MATCH_CONSTRAINT:
                if (i30 != 4) {
                    z6 = true;
                    break;
                }
            default:
                z6 = false;
                break;
        }
        int i31 = i29;
        if (this.mVisibility == 8) {
            i8 = 0;
            z6 = false;
        } else {
            i8 = i2;
        }
        if (z5) {
            if (!isConnected && !isConnected2 && !isConnected3) {
                linearSystem2.addEquality(createObjectVariable, i);
            } else if (isConnected && !isConnected2) {
                z7 = isConnected3;
                i9 = 6;
                linearSystem2.addEquality(createObjectVariable, createObjectVariable3, constraintAnchor.getMargin(), 6);
                if (z6) {
                    if (z2) {
                        linearSystem2.addEquality(createObjectVariable2, createObjectVariable, 0, 3);
                        if (i27 > 0) {
                            i26 = 6;
                            linearSystem2.addGreaterThan(createObjectVariable2, createObjectVariable, i27, 6);
                        } else {
                            i26 = 6;
                        }
                        if (i28 < Integer.MAX_VALUE) {
                            linearSystem2.addLowerThan(createObjectVariable2, createObjectVariable, i28, i26);
                        }
                    } else {
                        linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i8, i9);
                    }
                    i10 = i6;
                    i11 = i7;
                    solverVariable3 = createObjectVariable3;
                } else {
                    int i32 = i6;
                    if (i32 == -2) {
                        i11 = i7;
                        i24 = i8;
                    } else {
                        i24 = i32;
                        i11 = i7;
                    }
                    if (i11 == -2) {
                        i11 = i8;
                    }
                    if (i24 > 0) {
                        i25 = 6;
                        linearSystem2.addGreaterThan(createObjectVariable2, createObjectVariable, i24, 6);
                        i8 = Math.max(i8, i24);
                    } else {
                        i25 = 6;
                    }
                    if (i11 > 0) {
                        linearSystem2.addLowerThan(createObjectVariable2, createObjectVariable, i11, i25);
                        i8 = Math.min(i8, i11);
                    }
                    if (i30 == 1) {
                        if (z) {
                            linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i8, 6);
                        } else if (z4) {
                            linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i8, 4);
                        } else {
                            linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i8, 1);
                        }
                    } else if (i30 == 2) {
                        solverVariable3 = createObjectVariable3;
                        if (constraintAnchor.getType() == Type.TOP || constraintAnchor.getType() == Type.BOTTOM) {
                            SolverVariable createObjectVariable5 = linearSystem2.createObjectVariable(this.mParent.getAnchor(Type.TOP));
                            solverVariable15 = linearSystem2.createObjectVariable(this.mParent.getAnchor(Type.BOTTOM));
                            solverVariable14 = createObjectVariable5;
                        } else {
                            SolverVariable createObjectVariable6 = linearSystem2.createObjectVariable(this.mParent.getAnchor(Type.LEFT));
                            solverVariable15 = linearSystem2.createObjectVariable(this.mParent.getAnchor(Type.RIGHT));
                            solverVariable14 = createObjectVariable6;
                        }
                        linearSystem2.addConstraint(linearSystem.createRow().createRowDimensionRatio(createObjectVariable2, createObjectVariable, solverVariable15, solverVariable14, f2));
                        z6 = false;
                        if (!z6) {
                            i12 = i31;
                            if (i12 != 2) {
                                if (!z3) {
                                    int max = Math.max(i24, i8);
                                    if (i11 > 0) {
                                        max = Math.min(i11, max);
                                    }
                                    i10 = i24;
                                    linearSystem2.addEquality(createObjectVariable2, createObjectVariable, max, 6);
                                    z6 = false;
                                } else {
                                    i10 = i24;
                                }
                                if (z5) {
                                    solverVariable7 = createObjectVariable2;
                                    solverVariable5 = createObjectVariable;
                                    i15 = 0;
                                    i14 = 6;
                                    solverVariable6 = solverVariable2;
                                    solverVariable4 = solverVariable;
                                    i13 = 2;
                                } else if (z4) {
                                    solverVariable7 = createObjectVariable2;
                                    solverVariable5 = createObjectVariable;
                                    i15 = 0;
                                    i14 = 6;
                                    solverVariable6 = solverVariable2;
                                    i13 = 2;
                                    solverVariable4 = solverVariable;
                                } else {
                                    if (isConnected || isConnected2 || z7) {
                                        SolverVariable solverVariable19 = solverVariable2;
                                        if (!isConnected || isConnected2) {
                                            if (isConnected || !isConnected2) {
                                                SolverVariable solverVariable20 = solverVariable18;
                                                SolverVariable solverVariable21 = solverVariable;
                                                if (isConnected && isConnected2) {
                                                    if (z6) {
                                                        if (z && i27 == 0) {
                                                            linearSystem2.addGreaterThan(createObjectVariable2, createObjectVariable, 0, 6);
                                                        }
                                                        if (i30 == 0) {
                                                            if (i11 > 0 || i10 > 0) {
                                                                i23 = 4;
                                                                z14 = true;
                                                            } else {
                                                                i23 = 6;
                                                                z14 = false;
                                                            }
                                                            solverVariable9 = solverVariable3;
                                                            linearSystem2.addEquality(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), i23);
                                                            linearSystem2.addEquality(createObjectVariable2, solverVariable20, -constraintAnchor2.getMargin(), i23);
                                                            z9 = i11 > 0 || i10 > 0;
                                                            z8 = z14;
                                                            i18 = 5;
                                                        } else {
                                                            solverVariable9 = solverVariable3;
                                                            if (i30 == 1) {
                                                                z13 = true;
                                                                i18 = 6;
                                                            } else if (i30 == 3) {
                                                                int i33 = (z3 || this.mResolvedDimensionRatioSide == -1 || i11 > 0) ? 4 : 6;
                                                                linearSystem2.addEquality(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), i33);
                                                                linearSystem2.addEquality(createObjectVariable2, solverVariable20, -constraintAnchor2.getMargin(), i33);
                                                                z13 = true;
                                                                i18 = 5;
                                                            } else {
                                                                z12 = false;
                                                            }
                                                            z8 = true;
                                                        }
                                                        if (!z9) {
                                                            SolverVariable solverVariable22 = solverVariable19;
                                                            solverVariable10 = solverVariable20;
                                                            solverVariable11 = solverVariable9;
                                                            solverVariable13 = solverVariable21;
                                                            solverVariable8 = createObjectVariable2;
                                                            solverVariable12 = createObjectVariable;
                                                            linearSystem.addCentering(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), f, solverVariable10, createObjectVariable2, constraintAnchor2.getMargin(), i18);
                                                            z11 = true;
                                                            boolean z15 = constraintAnchor.mTarget.mOwner instanceof Barrier;
                                                            boolean z16 = constraintAnchor2.mTarget.mOwner instanceof Barrier;
                                                            if (z15 && !z16) {
                                                                z11 = z;
                                                                z10 = true;
                                                                i20 = 6;
                                                                i19 = 5;
                                                                if (!z8) {
                                                                }
                                                                linearSystem2.addGreaterThan(solverVariable12, solverVariable11, constraintAnchor.getMargin(), i22);
                                                                linearSystem2.addLowerThan(solverVariable8, solverVariable10, -constraintAnchor2.getMargin(), i21);
                                                                if (z) {
                                                                }
                                                                i17 = 0;
                                                                i16 = 6;
                                                                if (z) {
                                                                }
                                                                return;
                                                            } else if (!z15 && z16) {
                                                                z10 = z;
                                                                i20 = 5;
                                                                i19 = 6;
                                                                if (!z8) {
                                                                    i22 = 6;
                                                                    i21 = 6;
                                                                } else {
                                                                    i21 = i20;
                                                                    i22 = i19;
                                                                }
                                                                if ((!z6 && z11) || z8) {
                                                                    linearSystem2.addGreaterThan(solverVariable12, solverVariable11, constraintAnchor.getMargin(), i22);
                                                                }
                                                                if ((!z6 && z10) || z8) {
                                                                    linearSystem2.addLowerThan(solverVariable8, solverVariable10, -constraintAnchor2.getMargin(), i21);
                                                                }
                                                                if (z) {
                                                                    i17 = 0;
                                                                    i16 = 6;
                                                                    linearSystem2.addGreaterThan(solverVariable12, solverVariable13, 0, 6);
                                                                    if (z) {
                                                                        linearSystem2.addGreaterThan(solverVariable2, solverVariable8, i17, i16);
                                                                    }
                                                                    return;
                                                                }
                                                                i17 = 0;
                                                                i16 = 6;
                                                                if (z) {
                                                                }
                                                                return;
                                                            }
                                                        } else {
                                                            solverVariable10 = solverVariable20;
                                                            solverVariable8 = createObjectVariable2;
                                                            solverVariable12 = createObjectVariable;
                                                            solverVariable11 = solverVariable9;
                                                            ConstraintAnchor constraintAnchor4 = constraintAnchor;
                                                            ConstraintAnchor constraintAnchor5 = constraintAnchor2;
                                                            solverVariable13 = solverVariable21;
                                                        }
                                                        z11 = z;
                                                        z10 = z11;
                                                        i20 = 5;
                                                        i19 = 5;
                                                        if (!z8) {
                                                        }
                                                        linearSystem2.addGreaterThan(solverVariable12, solverVariable11, constraintAnchor.getMargin(), i22);
                                                        linearSystem2.addLowerThan(solverVariable8, solverVariable10, -constraintAnchor2.getMargin(), i21);
                                                        if (z) {
                                                        }
                                                        i17 = 0;
                                                        i16 = 6;
                                                        if (z) {
                                                        }
                                                        return;
                                                    }
                                                    solverVariable9 = solverVariable3;
                                                    z12 = true;
                                                    i18 = 5;
                                                    z8 = false;
                                                    if (!z9) {
                                                    }
                                                    z11 = z;
                                                    z10 = z11;
                                                    i20 = 5;
                                                    i19 = 5;
                                                    if (!z8) {
                                                    }
                                                    linearSystem2.addGreaterThan(solverVariable12, solverVariable11, constraintAnchor.getMargin(), i22);
                                                    linearSystem2.addLowerThan(solverVariable8, solverVariable10, -constraintAnchor2.getMargin(), i21);
                                                    if (z) {
                                                    }
                                                    i17 = 0;
                                                    i16 = 6;
                                                    if (z) {
                                                    }
                                                    return;
                                                }
                                            } else {
                                                linearSystem2.addEquality(createObjectVariable2, solverVariable18, -constraintAnchor2.getMargin(), 6);
                                                if (z) {
                                                    linearSystem2.addGreaterThan(createObjectVariable, solverVariable, 0, 5);
                                                }
                                            }
                                        } else if (z) {
                                            linearSystem2.addGreaterThan(solverVariable19, createObjectVariable2, 0, 5);
                                        }
                                    } else if (z) {
                                        linearSystem2.addGreaterThan(solverVariable2, createObjectVariable2, 0, 5);
                                    } else {
                                        SolverVariable solverVariable23 = solverVariable2;
                                    }
                                    solverVariable8 = createObjectVariable2;
                                    i17 = 0;
                                    i16 = 6;
                                    if (z) {
                                    }
                                    return;
                                }
                                if (i12 < i13 && z) {
                                    linearSystem2.addGreaterThan(solverVariable5, solverVariable4, i15, i14);
                                    linearSystem2.addGreaterThan(solverVariable6, solverVariable7, i15, i14);
                                }
                            }
                            i10 = i24;
                            if (z5) {
                            }
                            linearSystem2.addGreaterThan(solverVariable5, solverVariable4, i15, i14);
                            linearSystem2.addGreaterThan(solverVariable6, solverVariable7, i15, i14);
                        }
                        i10 = i24;
                    }
                    solverVariable3 = createObjectVariable3;
                    if (!z6) {
                    }
                }
                i12 = i31;
                if (z5) {
                }
                linearSystem2.addGreaterThan(solverVariable5, solverVariable4, i15, i14);
                linearSystem2.addGreaterThan(solverVariable6, solverVariable7, i15, i14);
            }
        }
        z7 = isConnected3;
        i9 = 6;
        if (z6) {
        }
        i12 = i31;
        if (z5) {
        }
        linearSystem2.addGreaterThan(solverVariable5, solverVariable4, i15, i14);
        linearSystem2.addGreaterThan(solverVariable6, solverVariable7, i15, i14);
    }

    private boolean isChainHead(int i) {
        int i2 = i * 2;
        if (!(this.mListAnchors[i2].mTarget == null || this.mListAnchors[i2].mTarget.mTarget == this.mListAnchors[i2])) {
            int i3 = i2 + 1;
            if (this.mListAnchors[i3].mTarget != null && this.mListAnchors[i3].mTarget.mTarget == this.mListAnchors[i3]) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:102:0x01c4, code lost:
        if (r15.mResolvedDimensionRatioSide == -1) goto L_0x01c8;
     */
    /* JADX WARNING: Removed duplicated region for block: B:105:0x01cb  */
    /* JADX WARNING: Removed duplicated region for block: B:109:0x01d7  */
    /* JADX WARNING: Removed duplicated region for block: B:115:0x01f0  */
    /* JADX WARNING: Removed duplicated region for block: B:124:0x025a  */
    /* JADX WARNING: Removed duplicated region for block: B:127:0x026b A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:128:0x026c  */
    /* JADX WARNING: Removed duplicated region for block: B:153:0x02d5  */
    /* JADX WARNING: Removed duplicated region for block: B:154:0x02e0  */
    /* JADX WARNING: Removed duplicated region for block: B:157:0x02e6  */
    /* JADX WARNING: Removed duplicated region for block: B:158:0x02f0  */
    /* JADX WARNING: Removed duplicated region for block: B:161:0x0327  */
    /* JADX WARNING: Removed duplicated region for block: B:165:0x0350  */
    /* JADX WARNING: Removed duplicated region for block: B:168:0x035a  */
    /* JADX WARNING: Removed duplicated region for block: B:99:0x01bd  */
    public void addToSolver(LinearSystem linearSystem) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        int i;
        int i2;
        boolean z5;
        SolverVariable solverVariable;
        int i3;
        int i4;
        boolean z6;
        SolverVariable solverVariable2;
        SolverVariable solverVariable3;
        SolverVariable solverVariable4;
        SolverVariable solverVariable5;
        boolean z7;
        boolean z8;
        LinearSystem linearSystem2;
        SolverVariable solverVariable6;
        ConstraintWidget constraintWidget;
        int i5;
        int i6;
        int i7;
        boolean z9;
        boolean z10;
        LinearSystem linearSystem3 = linearSystem;
        SolverVariable createObjectVariable = linearSystem3.createObjectVariable(this.mLeft);
        SolverVariable createObjectVariable2 = linearSystem3.createObjectVariable(this.mRight);
        SolverVariable createObjectVariable3 = linearSystem3.createObjectVariable(this.mTop);
        SolverVariable createObjectVariable4 = linearSystem3.createObjectVariable(this.mBottom);
        SolverVariable createObjectVariable5 = linearSystem3.createObjectVariable(this.mBaseline);
        if (this.mParent != null) {
            z4 = this.mParent != null && this.mParent.mListDimensionBehaviors[0] == DimensionBehaviour.WRAP_CONTENT;
            boolean z11 = this.mParent != null && this.mParent.mListDimensionBehaviors[1] == DimensionBehaviour.WRAP_CONTENT;
            if (isChainHead(0)) {
                ((ConstraintWidgetContainer) this.mParent).addChain(this, 0);
                z9 = true;
            } else {
                z9 = isInHorizontalChain();
            }
            if (isChainHead(1)) {
                ((ConstraintWidgetContainer) this.mParent).addChain(this, 1);
                z10 = true;
            } else {
                z10 = isInVerticalChain();
            }
            if (z4 && this.mVisibility != 8 && this.mLeft.mTarget == null && this.mRight.mTarget == null) {
                linearSystem3.addGreaterThan(linearSystem3.createObjectVariable(this.mParent.mRight), createObjectVariable2, 0, 1);
            }
            if (z11 && this.mVisibility != 8 && this.mTop.mTarget == null && this.mBottom.mTarget == null && this.mBaseline == null) {
                linearSystem3.addGreaterThan(linearSystem3.createObjectVariable(this.mParent.mBottom), createObjectVariable4, 0, 1);
            }
            z3 = z11;
            z2 = z9;
            z = z10;
        } else {
            z4 = false;
            z3 = false;
            z2 = false;
            z = false;
        }
        int i8 = this.mWidth;
        if (i8 < this.mMinWidth) {
            i8 = this.mMinWidth;
        }
        int i9 = this.mHeight;
        if (i9 < this.mMinHeight) {
            i9 = this.mMinHeight;
        }
        boolean z12 = this.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT;
        boolean z13 = this.mListDimensionBehaviors[1] != DimensionBehaviour.MATCH_CONSTRAINT;
        this.mResolvedDimensionRatioSide = this.mDimensionRatioSide;
        this.mResolvedDimensionRatio = this.mDimensionRatio;
        int i10 = this.mMatchConstraintDefaultWidth;
        int i11 = this.mMatchConstraintDefaultHeight;
        if (this.mDimensionRatio <= 0.0f || this.mVisibility == 8) {
            solverVariable = createObjectVariable5;
            i5 = i11;
            i6 = i8;
            i7 = i9;
            i4 = i10;
        } else {
            solverVariable = createObjectVariable5;
            if (this.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && i10 == 0) {
                i10 = 3;
            }
            if (this.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && i11 == 0) {
                i11 = 3;
            }
            if (this.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && this.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && i10 == 3 && i11 == 3) {
                setupDimensionRatio(z4, z3, z12, z13);
            } else if (this.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && i10 == 3) {
                this.mResolvedDimensionRatioSide = 0;
                int i12 = (int) (this.mResolvedDimensionRatio * ((float) this.mHeight));
                if (this.mListDimensionBehaviors[1] != DimensionBehaviour.MATCH_CONSTRAINT) {
                    i6 = i12;
                    i5 = i11;
                    i7 = i9;
                    i4 = 4;
                } else {
                    i2 = i12;
                    i3 = i11;
                    i = i9;
                    i4 = i10;
                    z5 = true;
                    this.mResolvedMatchConstraintDefault[0] = i4;
                    this.mResolvedMatchConstraintDefault[1] = i3;
                    if (!z5) {
                    }
                    z6 = false;
                    if (this.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT) {
                    }
                    boolean z14 = !this.mCenter.isConnected();
                    if (this.mHorizontalResolution != 2) {
                    }
                    if (this.mVerticalResolution != 2) {
                    }
                }
            } else if (this.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && i11 == 3) {
                this.mResolvedDimensionRatioSide = 1;
                if (this.mDimensionRatioSide == -1) {
                    this.mResolvedDimensionRatio = 1.0f / this.mResolvedDimensionRatio;
                }
                int i13 = (int) (this.mResolvedDimensionRatio * ((float) this.mWidth));
                if (this.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT) {
                    i7 = i13;
                    i6 = i8;
                    i4 = i10;
                    i5 = 4;
                } else {
                    i = i13;
                    i3 = i11;
                    i2 = i8;
                    i4 = i10;
                    z5 = true;
                    this.mResolvedMatchConstraintDefault[0] = i4;
                    this.mResolvedMatchConstraintDefault[1] = i3;
                    if (!z5) {
                        if (this.mResolvedDimensionRatioSide != 0) {
                        }
                        z6 = true;
                        boolean z15 = this.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT && (this instanceof ConstraintWidgetContainer);
                        boolean z142 = !this.mCenter.isConnected();
                        if (this.mHorizontalResolution != 2) {
                            z7 = z3;
                            solverVariable3 = solverVariable;
                            solverVariable5 = createObjectVariable4;
                            solverVariable2 = createObjectVariable3;
                            boolean z16 = z15;
                            solverVariable4 = createObjectVariable2;
                            applyConstraints(linearSystem, z4, this.mParent != null ? linearSystem3.createObjectVariable(this.mParent.mLeft) : null, this.mParent != null ? linearSystem3.createObjectVariable(this.mParent.mRight) : null, this.mListDimensionBehaviors[0], z16, this.mLeft, this.mRight, this.mX, i2, this.mMinWidth, this.mMaxDimension[0], this.mHorizontalBiasPercent, z6, z2, i4, this.mMatchConstraintMinWidth, this.mMatchConstraintMaxWidth, this.mMatchConstraintPercentWidth, z142);
                        } else {
                            solverVariable2 = createObjectVariable3;
                            solverVariable4 = createObjectVariable2;
                            z7 = z3;
                            solverVariable3 = solverVariable;
                            solverVariable5 = createObjectVariable4;
                        }
                        if (this.mVerticalResolution != 2) {
                            boolean z17 = this.mListDimensionBehaviors[1] == DimensionBehaviour.WRAP_CONTENT && (this instanceof ConstraintWidgetContainer);
                            boolean z18 = z5 && (this.mResolvedDimensionRatioSide == 1 || this.mResolvedDimensionRatioSide == -1);
                            if (this.mBaselineDistance <= 0) {
                                solverVariable6 = solverVariable2;
                                linearSystem2 = linearSystem;
                            } else if (this.mBaseline.getResolutionNode().state == 1) {
                                linearSystem2 = linearSystem;
                                this.mBaseline.getResolutionNode().addResolvedValue(linearSystem2);
                                solverVariable6 = solverVariable2;
                            } else {
                                linearSystem2 = linearSystem;
                                SolverVariable solverVariable7 = solverVariable3;
                                solverVariable6 = solverVariable2;
                                linearSystem2.addEquality(solverVariable7, solverVariable6, getBaselineDistance(), 6);
                                if (this.mBaseline.mTarget != null) {
                                    linearSystem2.addEquality(solverVariable7, linearSystem2.createObjectVariable(this.mBaseline.mTarget), 0, 6);
                                    z8 = false;
                                    boolean z19 = z7;
                                    SolverVariable solverVariable8 = solverVariable6;
                                    applyConstraints(linearSystem, z19, this.mParent == null ? linearSystem2.createObjectVariable(this.mParent.mTop) : null, this.mParent == null ? linearSystem2.createObjectVariable(this.mParent.mBottom) : null, this.mListDimensionBehaviors[1], z17, this.mTop, this.mBottom, this.mY, i, this.mMinHeight, this.mMaxDimension[1], this.mVerticalBiasPercent, z18, z, i3, this.mMatchConstraintMinHeight, this.mMatchConstraintMaxHeight, this.mMatchConstraintPercentHeight, z8);
                                    if (!z5) {
                                        constraintWidget = this;
                                        if (constraintWidget.mResolvedDimensionRatioSide == 1) {
                                            linearSystem.addRatio(solverVariable5, solverVariable8, solverVariable4, createObjectVariable, constraintWidget.mResolvedDimensionRatio, 6);
                                        } else {
                                            linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable5, solverVariable8, constraintWidget.mResolvedDimensionRatio, 6);
                                        }
                                    } else {
                                        constraintWidget = this;
                                    }
                                    if (constraintWidget.mCenter.isConnected()) {
                                        linearSystem.addCenterPoint(constraintWidget, constraintWidget.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget.mCircleConstraintAngle + 90.0f)), constraintWidget.mCenter.getMargin());
                                    }
                                    return;
                                }
                            }
                            z8 = z142;
                            if (this.mParent == null) {
                            }
                            boolean z192 = z7;
                            SolverVariable solverVariable82 = solverVariable6;
                            applyConstraints(linearSystem, z192, this.mParent == null ? linearSystem2.createObjectVariable(this.mParent.mTop) : null, this.mParent == null ? linearSystem2.createObjectVariable(this.mParent.mBottom) : null, this.mListDimensionBehaviors[1], z17, this.mTop, this.mBottom, this.mY, i, this.mMinHeight, this.mMaxDimension[1], this.mVerticalBiasPercent, z18, z, i3, this.mMatchConstraintMinHeight, this.mMatchConstraintMaxHeight, this.mMatchConstraintPercentHeight, z8);
                            if (!z5) {
                            }
                            if (constraintWidget.mCenter.isConnected()) {
                            }
                            return;
                        }
                        return;
                    }
                    z6 = false;
                    if (this.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT) {
                    }
                    boolean z1422 = !this.mCenter.isConnected();
                    if (this.mHorizontalResolution != 2) {
                    }
                    if (this.mVerticalResolution != 2) {
                    }
                }
            }
            i3 = i11;
            i2 = i8;
            i = i9;
            i4 = i10;
            z5 = true;
            this.mResolvedMatchConstraintDefault[0] = i4;
            this.mResolvedMatchConstraintDefault[1] = i3;
            if (!z5) {
            }
            z6 = false;
            if (this.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT) {
            }
            boolean z14222 = !this.mCenter.isConnected();
            if (this.mHorizontalResolution != 2) {
            }
            if (this.mVerticalResolution != 2) {
            }
        }
        z5 = false;
        this.mResolvedMatchConstraintDefault[0] = i4;
        this.mResolvedMatchConstraintDefault[1] = i3;
        if (!z5) {
        }
        z6 = false;
        if (this.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT) {
        }
        boolean z142222 = !this.mCenter.isConnected();
        if (this.mHorizontalResolution != 2) {
        }
        if (this.mVerticalResolution != 2) {
        }
    }

    public boolean allowedInBarrier() {
        return this.mVisibility != 8;
    }

    public void analyze(int i) {
        Optimizer.analyze(i, this);
    }

    public void connectCircularConstraint(ConstraintWidget constraintWidget, float f, int i) {
        immediateConnect(Type.CENTER, constraintWidget, Type.CENTER, i, 0);
        this.mCircleConstraintAngle = f;
    }

    public void createObjectVariables(LinearSystem linearSystem) {
        linearSystem.createObjectVariable(this.mLeft);
        linearSystem.createObjectVariable(this.mTop);
        linearSystem.createObjectVariable(this.mRight);
        linearSystem.createObjectVariable(this.mBottom);
        if (this.mBaselineDistance > 0) {
            linearSystem.createObjectVariable(this.mBaseline);
        }
    }

    public ConstraintAnchor getAnchor(Type type) {
        switch (type) {
            case LEFT:
                return this.mLeft;
            case TOP:
                return this.mTop;
            case RIGHT:
                return this.mRight;
            case BOTTOM:
                return this.mBottom;
            case BASELINE:
                return this.mBaseline;
            case CENTER:
                return this.mCenter;
            case CENTER_X:
                return this.mCenterX;
            case CENTER_Y:
                return this.mCenterY;
            case NONE:
                return null;
            default:
                throw new AssertionError(type.name());
        }
    }

    public ArrayList<ConstraintAnchor> getAnchors() {
        return this.mAnchors;
    }

    public int getBaselineDistance() {
        return this.mBaselineDistance;
    }

    public float getBiasPercent(int i) {
        if (i == 0) {
            return this.mHorizontalBiasPercent;
        }
        if (i == 1) {
            return this.mVerticalBiasPercent;
        }
        return -1.0f;
    }

    public int getBottom() {
        return getY() + this.mHeight;
    }

    public Object getCompanionWidget() {
        return this.mCompanionWidget;
    }

    public String getDebugName() {
        return this.mDebugName;
    }

    public DimensionBehaviour getDimensionBehaviour(int i) {
        if (i == 0) {
            return getHorizontalDimensionBehaviour();
        }
        if (i == 1) {
            return getVerticalDimensionBehaviour();
        }
        return null;
    }

    public int getDrawX() {
        return this.mDrawX + this.mOffsetX;
    }

    public int getDrawY() {
        return this.mDrawY + this.mOffsetY;
    }

    public int getHeight() {
        if (this.mVisibility == 8) {
            return 0;
        }
        return this.mHeight;
    }

    public DimensionBehaviour getHorizontalDimensionBehaviour() {
        return this.mListDimensionBehaviors[0];
    }

    public int getLength(int i) {
        if (i == 0) {
            return getWidth();
        }
        if (i == 1) {
            return getHeight();
        }
        return 0;
    }

    public ConstraintWidget getParent() {
        return this.mParent;
    }

    /* access modifiers changed from: 0000 */
    public int getRelativePositioning(int i) {
        if (i == 0) {
            return this.mRelX;
        }
        if (i == 1) {
            return this.mRelY;
        }
        return 0;
    }

    public ResolutionDimension getResolutionHeight() {
        if (this.mResolutionHeight == null) {
            this.mResolutionHeight = new ResolutionDimension();
        }
        return this.mResolutionHeight;
    }

    public ResolutionDimension getResolutionWidth() {
        if (this.mResolutionWidth == null) {
            this.mResolutionWidth = new ResolutionDimension();
        }
        return this.mResolutionWidth;
    }

    public int getRight() {
        return getX() + this.mWidth;
    }

    /* access modifiers changed from: protected */
    public int getRootX() {
        return this.mX + this.mOffsetX;
    }

    /* access modifiers changed from: protected */
    public int getRootY() {
        return this.mY + this.mOffsetY;
    }

    public DimensionBehaviour getVerticalDimensionBehaviour() {
        return this.mListDimensionBehaviors[1];
    }

    public int getVisibility() {
        return this.mVisibility;
    }

    public int getWidth() {
        if (this.mVisibility == 8) {
            return 0;
        }
        return this.mWidth;
    }

    public int getWrapHeight() {
        return this.mWrapHeight;
    }

    public int getWrapWidth() {
        return this.mWrapWidth;
    }

    public int getX() {
        return this.mX;
    }

    public int getY() {
        return this.mY;
    }

    public boolean hasBaseline() {
        return this.mBaselineDistance > 0;
    }

    public void immediateConnect(Type type, ConstraintWidget constraintWidget, Type type2, int i, int i2) {
        getAnchor(type).connect(constraintWidget.getAnchor(type2), i, i2, Strength.STRONG, 0, true);
    }

    public boolean isFullyResolved() {
        return this.mLeft.getResolutionNode().state == 1 && this.mRight.getResolutionNode().state == 1 && this.mTop.getResolutionNode().state == 1 && this.mBottom.getResolutionNode().state == 1;
    }

    public boolean isInHorizontalChain() {
        return (this.mLeft.mTarget != null && this.mLeft.mTarget.mTarget == this.mLeft) || (this.mRight.mTarget != null && this.mRight.mTarget.mTarget == this.mRight);
    }

    public boolean isInVerticalChain() {
        return (this.mTop.mTarget != null && this.mTop.mTarget.mTarget == this.mTop) || (this.mBottom.mTarget != null && this.mBottom.mTarget.mTarget == this.mBottom);
    }

    public boolean isSpreadHeight() {
        return this.mMatchConstraintDefaultHeight == 0 && this.mDimensionRatio == 0.0f && this.mMatchConstraintMinHeight == 0 && this.mMatchConstraintMaxHeight == 0 && this.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT;
    }

    public boolean isSpreadWidth() {
        return this.mMatchConstraintDefaultWidth == 0 && this.mDimensionRatio == 0.0f && this.mMatchConstraintMinWidth == 0 && this.mMatchConstraintMaxWidth == 0 && this.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT;
    }

    public void reset() {
        this.mLeft.reset();
        this.mTop.reset();
        this.mRight.reset();
        this.mBottom.reset();
        this.mBaseline.reset();
        this.mCenterX.reset();
        this.mCenterY.reset();
        this.mCenter.reset();
        this.mParent = null;
        this.mCircleConstraintAngle = 0.0f;
        this.mWidth = 0;
        this.mHeight = 0;
        this.mDimensionRatio = 0.0f;
        this.mDimensionRatioSide = -1;
        this.mX = 0;
        this.mY = 0;
        this.mDrawX = 0;
        this.mDrawY = 0;
        this.mDrawWidth = 0;
        this.mDrawHeight = 0;
        this.mOffsetX = 0;
        this.mOffsetY = 0;
        this.mBaselineDistance = 0;
        this.mMinWidth = 0;
        this.mMinHeight = 0;
        this.mWrapWidth = 0;
        this.mWrapHeight = 0;
        this.mHorizontalBiasPercent = DEFAULT_BIAS;
        this.mVerticalBiasPercent = DEFAULT_BIAS;
        this.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
        this.mListDimensionBehaviors[1] = DimensionBehaviour.FIXED;
        this.mCompanionWidget = null;
        this.mContainerItemSkip = 0;
        this.mVisibility = 0;
        this.mType = null;
        this.mHorizontalWrapVisited = false;
        this.mVerticalWrapVisited = false;
        this.mHorizontalChainStyle = 0;
        this.mVerticalChainStyle = 0;
        this.mHorizontalChainFixedPosition = false;
        this.mVerticalChainFixedPosition = false;
        this.mWeight[0] = -1.0f;
        this.mWeight[1] = -1.0f;
        this.mHorizontalResolution = -1;
        this.mVerticalResolution = -1;
        this.mMaxDimension[0] = Integer.MAX_VALUE;
        this.mMaxDimension[1] = Integer.MAX_VALUE;
        this.mMatchConstraintDefaultWidth = 0;
        this.mMatchConstraintDefaultHeight = 0;
        this.mMatchConstraintPercentWidth = 1.0f;
        this.mMatchConstraintPercentHeight = 1.0f;
        this.mMatchConstraintMaxWidth = Integer.MAX_VALUE;
        this.mMatchConstraintMaxHeight = Integer.MAX_VALUE;
        this.mMatchConstraintMinWidth = 0;
        this.mMatchConstraintMinHeight = 0;
        this.mResolvedDimensionRatioSide = -1;
        this.mResolvedDimensionRatio = 1.0f;
        if (this.mResolutionWidth != null) {
            this.mResolutionWidth.reset();
        }
        if (this.mResolutionHeight != null) {
            this.mResolutionHeight.reset();
        }
        this.mBelongingGroup = null;
        this.mOptimizerMeasurable = false;
        this.mOptimizerMeasured = false;
        this.mGroupsToSolver = false;
    }

    public void resetAnchors() {
        ConstraintWidget parent = getParent();
        if (parent == null || !(parent instanceof ConstraintWidgetContainer) || !((ConstraintWidgetContainer) getParent()).handlesInternalConstraints()) {
            int size = this.mAnchors.size();
            for (int i = 0; i < size; i++) {
                ((ConstraintAnchor) this.mAnchors.get(i)).reset();
            }
        }
    }

    public void resetResolutionNodes() {
        for (int i = 0; i < 6; i++) {
            this.mListAnchors[i].getResolutionNode().reset();
        }
    }

    public void resetSolverVariables(Cache cache) {
        this.mLeft.resetSolverVariable(cache);
        this.mTop.resetSolverVariable(cache);
        this.mRight.resetSolverVariable(cache);
        this.mBottom.resetSolverVariable(cache);
        this.mBaseline.resetSolverVariable(cache);
        this.mCenter.resetSolverVariable(cache);
        this.mCenterX.resetSolverVariable(cache);
        this.mCenterY.resetSolverVariable(cache);
    }

    public void resolve() {
    }

    public void setBaselineDistance(int i) {
        this.mBaselineDistance = i;
    }

    public void setCompanionWidget(Object obj) {
        this.mCompanionWidget = obj;
    }

    public void setDebugName(String str) {
        this.mDebugName = str;
    }

    /* JADX WARNING: Removed duplicated region for block: B:39:0x0089  */
    public void setDimensionRatio(String str) {
        float f;
        if (str == null || str.length() == 0) {
            this.mDimensionRatio = 0.0f;
            return;
        }
        int i = -1;
        int length = str.length();
        int indexOf = str.indexOf(44);
        int i2 = 0;
        if (indexOf > 0 && indexOf < length - 1) {
            String substring = str.substring(0, indexOf);
            if (substring.equalsIgnoreCase("W")) {
                i = 0;
            } else if (substring.equalsIgnoreCase("H")) {
                i = 1;
            }
            i2 = indexOf + 1;
        }
        int indexOf2 = str.indexOf(58);
        if (indexOf2 < 0 || indexOf2 >= length - 1) {
            String substring2 = str.substring(i2);
            if (substring2.length() > 0) {
                f = Float.parseFloat(substring2);
                if (f > 0.0f) {
                    this.mDimensionRatio = f;
                    this.mDimensionRatioSide = i;
                }
            }
        } else {
            String substring3 = str.substring(i2, indexOf2);
            String substring4 = str.substring(indexOf2 + 1);
            if (substring3.length() > 0 && substring4.length() > 0) {
                try {
                    float parseFloat = Float.parseFloat(substring3);
                    float parseFloat2 = Float.parseFloat(substring4);
                    if (parseFloat > 0.0f && parseFloat2 > 0.0f) {
                        f = i == 1 ? Math.abs(parseFloat2 / parseFloat) : Math.abs(parseFloat / parseFloat2);
                        if (f > 0.0f) {
                        }
                    }
                } catch (NumberFormatException unused) {
                }
            }
        }
        f = 0.0f;
        if (f > 0.0f) {
        }
    }

    public void setFrame(int i, int i2, int i3) {
        if (i3 == 0) {
            setHorizontalDimension(i, i2);
        } else if (i3 == 1) {
            setVerticalDimension(i, i2);
        }
        this.mOptimizerMeasured = true;
    }

    public void setFrame(int i, int i2, int i3, int i4) {
        int i5 = i3 - i;
        int i6 = i4 - i2;
        this.mX = i;
        this.mY = i2;
        if (this.mVisibility == 8) {
            this.mWidth = 0;
            this.mHeight = 0;
            return;
        }
        if (this.mListDimensionBehaviors[0] == DimensionBehaviour.FIXED && i5 < this.mWidth) {
            i5 = this.mWidth;
        }
        if (this.mListDimensionBehaviors[1] == DimensionBehaviour.FIXED && i6 < this.mHeight) {
            i6 = this.mHeight;
        }
        this.mWidth = i5;
        this.mHeight = i6;
        if (this.mHeight < this.mMinHeight) {
            this.mHeight = this.mMinHeight;
        }
        if (this.mWidth < this.mMinWidth) {
            this.mWidth = this.mMinWidth;
        }
        this.mOptimizerMeasured = true;
    }

    public void setHeight(int i) {
        this.mHeight = i;
        if (this.mHeight < this.mMinHeight) {
            this.mHeight = this.mMinHeight;
        }
    }

    public void setHeightWrapContent(boolean z) {
        this.mIsHeightWrapContent = z;
    }

    public void setHorizontalBiasPercent(float f) {
        this.mHorizontalBiasPercent = f;
    }

    public void setHorizontalChainStyle(int i) {
        this.mHorizontalChainStyle = i;
    }

    public void setHorizontalDimension(int i, int i2) {
        this.mX = i;
        this.mWidth = i2 - i;
        if (this.mWidth < this.mMinWidth) {
            this.mWidth = this.mMinWidth;
        }
    }

    public void setHorizontalDimensionBehaviour(DimensionBehaviour dimensionBehaviour) {
        this.mListDimensionBehaviors[0] = dimensionBehaviour;
        if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
            setWidth(this.mWrapWidth);
        }
    }

    public void setHorizontalMatchStyle(int i, int i2, int i3, float f) {
        this.mMatchConstraintDefaultWidth = i;
        this.mMatchConstraintMinWidth = i2;
        this.mMatchConstraintMaxWidth = i3;
        this.mMatchConstraintPercentWidth = f;
        if (f < 1.0f && this.mMatchConstraintDefaultWidth == 0) {
            this.mMatchConstraintDefaultWidth = 2;
        }
    }

    public void setHorizontalWeight(float f) {
        this.mWeight[0] = f;
    }

    public void setMaxHeight(int i) {
        this.mMaxDimension[1] = i;
    }

    public void setMaxWidth(int i) {
        this.mMaxDimension[0] = i;
    }

    public void setMinHeight(int i) {
        if (i < 0) {
            this.mMinHeight = 0;
        } else {
            this.mMinHeight = i;
        }
    }

    public void setMinWidth(int i) {
        if (i < 0) {
            this.mMinWidth = 0;
        } else {
            this.mMinWidth = i;
        }
    }

    public void setOffset(int i, int i2) {
        this.mOffsetX = i;
        this.mOffsetY = i2;
    }

    public void setOrigin(int i, int i2) {
        this.mX = i;
        this.mY = i2;
    }

    public void setParent(ConstraintWidget constraintWidget) {
        this.mParent = constraintWidget;
    }

    /* access modifiers changed from: 0000 */
    public void setRelativePositioning(int i, int i2) {
        if (i2 == 0) {
            this.mRelX = i;
        } else if (i2 == 1) {
            this.mRelY = i;
        }
    }

    public void setVerticalBiasPercent(float f) {
        this.mVerticalBiasPercent = f;
    }

    public void setVerticalChainStyle(int i) {
        this.mVerticalChainStyle = i;
    }

    public void setVerticalDimension(int i, int i2) {
        this.mY = i;
        this.mHeight = i2 - i;
        if (this.mHeight < this.mMinHeight) {
            this.mHeight = this.mMinHeight;
        }
    }

    public void setVerticalDimensionBehaviour(DimensionBehaviour dimensionBehaviour) {
        this.mListDimensionBehaviors[1] = dimensionBehaviour;
        if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
            setHeight(this.mWrapHeight);
        }
    }

    public void setVerticalMatchStyle(int i, int i2, int i3, float f) {
        this.mMatchConstraintDefaultHeight = i;
        this.mMatchConstraintMinHeight = i2;
        this.mMatchConstraintMaxHeight = i3;
        this.mMatchConstraintPercentHeight = f;
        if (f < 1.0f && this.mMatchConstraintDefaultHeight == 0) {
            this.mMatchConstraintDefaultHeight = 2;
        }
    }

    public void setVerticalWeight(float f) {
        this.mWeight[1] = f;
    }

    public void setVisibility(int i) {
        this.mVisibility = i;
    }

    public void setWidth(int i) {
        this.mWidth = i;
        if (this.mWidth < this.mMinWidth) {
            this.mWidth = this.mMinWidth;
        }
    }

    public void setWidthWrapContent(boolean z) {
        this.mIsWidthWrapContent = z;
    }

    public void setWrapHeight(int i) {
        this.mWrapHeight = i;
    }

    public void setWrapWidth(int i) {
        this.mWrapWidth = i;
    }

    public void setX(int i) {
        this.mX = i;
    }

    public void setY(int i) {
        this.mY = i;
    }

    public void setupDimensionRatio(boolean z, boolean z2, boolean z3, boolean z4) {
        if (this.mResolvedDimensionRatioSide == -1) {
            if (z3 && !z4) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (!z3 && z4) {
                this.mResolvedDimensionRatioSide = 1;
                if (this.mDimensionRatioSide == -1) {
                    this.mResolvedDimensionRatio = 1.0f / this.mResolvedDimensionRatio;
                }
            }
        }
        if (this.mResolvedDimensionRatioSide == 0 && (!this.mTop.isConnected() || !this.mBottom.isConnected())) {
            this.mResolvedDimensionRatioSide = 1;
        } else if (this.mResolvedDimensionRatioSide == 1 && (!this.mLeft.isConnected() || !this.mRight.isConnected())) {
            this.mResolvedDimensionRatioSide = 0;
        }
        if (this.mResolvedDimensionRatioSide == -1 && (!this.mTop.isConnected() || !this.mBottom.isConnected() || !this.mLeft.isConnected() || !this.mRight.isConnected())) {
            if (this.mTop.isConnected() && this.mBottom.isConnected()) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (this.mLeft.isConnected() && this.mRight.isConnected()) {
                this.mResolvedDimensionRatio = 1.0f / this.mResolvedDimensionRatio;
                this.mResolvedDimensionRatioSide = 1;
            }
        }
        if (this.mResolvedDimensionRatioSide == -1) {
            if (z && !z2) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (!z && z2) {
                this.mResolvedDimensionRatio = 1.0f / this.mResolvedDimensionRatio;
                this.mResolvedDimensionRatioSide = 1;
            }
        }
        if (this.mResolvedDimensionRatioSide == -1) {
            if (this.mMatchConstraintMinWidth > 0 && this.mMatchConstraintMinHeight == 0) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (this.mMatchConstraintMinWidth == 0 && this.mMatchConstraintMinHeight > 0) {
                this.mResolvedDimensionRatio = 1.0f / this.mResolvedDimensionRatio;
                this.mResolvedDimensionRatioSide = 1;
            }
        }
        if (this.mResolvedDimensionRatioSide == -1 && z && z2) {
            this.mResolvedDimensionRatio = 1.0f / this.mResolvedDimensionRatio;
            this.mResolvedDimensionRatioSide = 1;
        }
    }

    public String toString() {
        String str;
        String str2;
        StringBuilder sb = new StringBuilder();
        if (this.mType != null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("type: ");
            sb2.append(this.mType);
            sb2.append(" ");
            str = sb2.toString();
        } else {
            str = "";
        }
        sb.append(str);
        if (this.mDebugName != null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("id: ");
            sb3.append(this.mDebugName);
            sb3.append(" ");
            str2 = sb3.toString();
        } else {
            str2 = "";
        }
        sb.append(str2);
        sb.append("(");
        sb.append(this.mX);
        sb.append(", ");
        sb.append(this.mY);
        sb.append(") - (");
        sb.append(this.mWidth);
        sb.append(" x ");
        sb.append(this.mHeight);
        sb.append(") wrap: (");
        sb.append(this.mWrapWidth);
        sb.append(" x ");
        sb.append(this.mWrapHeight);
        sb.append(")");
        return sb.toString();
    }

    public void updateDrawPosition() {
        int i = this.mX;
        int i2 = this.mY;
        int i3 = this.mX + this.mWidth;
        int i4 = this.mY + this.mHeight;
        this.mDrawX = i;
        this.mDrawY = i2;
        this.mDrawWidth = i3 - i;
        this.mDrawHeight = i4 - i2;
    }

    public void updateFromSolver(LinearSystem linearSystem) {
        int objectVariableValue = linearSystem.getObjectVariableValue(this.mLeft);
        int objectVariableValue2 = linearSystem.getObjectVariableValue(this.mTop);
        int objectVariableValue3 = linearSystem.getObjectVariableValue(this.mRight);
        int objectVariableValue4 = linearSystem.getObjectVariableValue(this.mBottom);
        int i = objectVariableValue4 - objectVariableValue2;
        if (objectVariableValue3 - objectVariableValue < 0 || i < 0 || objectVariableValue == Integer.MIN_VALUE || objectVariableValue == Integer.MAX_VALUE || objectVariableValue2 == Integer.MIN_VALUE || objectVariableValue2 == Integer.MAX_VALUE || objectVariableValue3 == Integer.MIN_VALUE || objectVariableValue3 == Integer.MAX_VALUE || objectVariableValue4 == Integer.MIN_VALUE || objectVariableValue4 == Integer.MAX_VALUE) {
            objectVariableValue4 = 0;
            objectVariableValue = 0;
            objectVariableValue2 = 0;
            objectVariableValue3 = 0;
        }
        setFrame(objectVariableValue, objectVariableValue2, objectVariableValue3, objectVariableValue4);
    }

    public void updateResolutionNodes() {
        for (int i = 0; i < 6; i++) {
            this.mListAnchors[i].getResolutionNode().update();
        }
    }
}
