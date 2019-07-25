package android.support.constraint.solver.widgets;

import android.support.constraint.solver.ArrayRow;
import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import java.util.ArrayList;

class Chain {
    static void applyChainConstraints(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem linearSystem, int i) {
        int i2;
        ChainHead[] chainHeadArr;
        int i3;
        if (i == 0) {
            int i4 = constraintWidgetContainer.mHorizontalChainsSize;
            chainHeadArr = constraintWidgetContainer.mHorizontalChainsArray;
            i2 = i4;
            i3 = 0;
        } else {
            i3 = 2;
            int i5 = constraintWidgetContainer.mVerticalChainsSize;
            i2 = i5;
            chainHeadArr = constraintWidgetContainer.mVerticalChainsArray;
        }
        for (int i6 = 0; i6 < i2; i6++) {
            ChainHead chainHead = chainHeadArr[i6];
            chainHead.define();
            if (!constraintWidgetContainer.optimizeFor(4)) {
                applyChainConstraints(constraintWidgetContainer, linearSystem, i, i3, chainHead);
            } else if (!Optimizer.applyChainOptimized(constraintWidgetContainer, linearSystem, i, i3, chainHead)) {
                applyChainConstraints(constraintWidgetContainer, linearSystem, i, i3, chainHead);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0035, code lost:
        if (r2.mHorizontalChainStyle == 2) goto L_0x0037;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0039, code lost:
        r5 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0053, code lost:
        if (r2.mVerticalChainStyle == 2) goto L_0x0037;
     */
    /* JADX WARNING: Removed duplicated region for block: B:194:0x03b4  */
    /* JADX WARNING: Removed duplicated region for block: B:195:0x03b7  */
    /* JADX WARNING: Removed duplicated region for block: B:208:0x03dc  */
    /* JADX WARNING: Removed duplicated region for block: B:258:0x04b9  */
    /* JADX WARNING: Removed duplicated region for block: B:264:0x04f2  */
    /* JADX WARNING: Removed duplicated region for block: B:274:0x051c  */
    /* JADX WARNING: Removed duplicated region for block: B:275:0x0521  */
    /* JADX WARNING: Removed duplicated region for block: B:278:0x0527  */
    /* JADX WARNING: Removed duplicated region for block: B:279:0x052c  */
    /* JADX WARNING: Removed duplicated region for block: B:281:0x0530  */
    /* JADX WARNING: Removed duplicated region for block: B:287:0x0542  */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x0164  */
    /* JADX WARNING: Removed duplicated region for block: B:85:0x0182  */
    static void applyChainConstraints(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem linearSystem, int i, int i2, ChainHead chainHead) {
        boolean z;
        boolean z2;
        ArrayList<ConstraintWidget> arrayList;
        SolverVariable solverVariable;
        ConstraintWidget constraintWidget;
        ConstraintWidget constraintWidget2;
        ConstraintAnchor constraintAnchor;
        ConstraintAnchor constraintAnchor2;
        ConstraintAnchor constraintAnchor3;
        LinearSystem linearSystem2;
        LinearSystem linearSystem3;
        ConstraintWidget constraintWidget3;
        ConstraintWidget constraintWidget4;
        ConstraintWidget constraintWidget5;
        SolverVariable solverVariable2;
        SolverVariable solverVariable3;
        ConstraintAnchor constraintAnchor4;
        ConstraintWidget constraintWidget6;
        ConstraintWidget constraintWidget7;
        ConstraintWidget constraintWidget8;
        ConstraintWidget constraintWidget9;
        int i3;
        ConstraintWidget constraintWidget10;
        ConstraintAnchor constraintAnchor5;
        SolverVariable solverVariable4;
        SolverVariable solverVariable5;
        ConstraintAnchor constraintAnchor6;
        int i4;
        ArrayList<ConstraintWidget> arrayList2;
        ConstraintWidget constraintWidget11;
        boolean z3;
        int i5;
        boolean z4;
        ConstraintWidget constraintWidget12;
        int i6;
        ConstraintWidgetContainer constraintWidgetContainer2 = constraintWidgetContainer;
        LinearSystem linearSystem4 = linearSystem;
        ChainHead chainHead2 = chainHead;
        ConstraintWidget constraintWidget13 = chainHead2.mFirst;
        ConstraintWidget constraintWidget14 = chainHead2.mLast;
        ConstraintWidget constraintWidget15 = chainHead2.mFirstVisibleWidget;
        ConstraintWidget constraintWidget16 = chainHead2.mLastVisibleWidget;
        ConstraintWidget constraintWidget17 = chainHead2.mHead;
        float f = chainHead2.mTotalWeight;
        ConstraintWidget constraintWidget18 = chainHead2.mFirstMatchConstraintWidget;
        ConstraintWidget constraintWidget19 = chainHead2.mLastMatchConstraintWidget;
        boolean z5 = constraintWidgetContainer2.mListDimensionBehaviors[i] == DimensionBehaviour.WRAP_CONTENT;
        if (i == 0) {
            z = constraintWidget17.mHorizontalChainStyle == 0;
            z2 = constraintWidget17.mHorizontalChainStyle == 1;
        } else {
            z = constraintWidget17.mVerticalChainStyle == 0;
            z2 = constraintWidget17.mVerticalChainStyle == 1;
        }
        boolean z6 = true;
        boolean z7 = z6;
        boolean z8 = z2;
        boolean z9 = z;
        ConstraintWidget constraintWidget20 = constraintWidget13;
        boolean z10 = false;
        while (true) {
            ConstraintWidget constraintWidget21 = null;
            if (z10) {
                break;
            }
            ConstraintAnchor constraintAnchor7 = constraintWidget20.mListAnchors[i2];
            int i7 = (z5 || z7) ? 1 : 4;
            int margin = constraintAnchor7.getMargin();
            float f2 = f;
            if (!(constraintAnchor7.mTarget == null || constraintWidget20 == constraintWidget13)) {
                margin += constraintAnchor7.mTarget.getMargin();
            }
            int i8 = margin;
            if (z7 && constraintWidget20 != constraintWidget13 && constraintWidget20 != constraintWidget15) {
                constraintWidget11 = constraintWidget17;
                z3 = z10;
                i5 = 6;
            } else if (!z9 || !z5) {
                constraintWidget11 = constraintWidget17;
                z3 = z10;
                i5 = i7;
            } else {
                constraintWidget11 = constraintWidget17;
                z3 = z10;
                i5 = 4;
            }
            if (constraintAnchor7.mTarget != null) {
                if (constraintWidget20 == constraintWidget15) {
                    constraintWidget12 = constraintWidget13;
                    z4 = z7;
                    linearSystem4.addGreaterThan(constraintAnchor7.mSolverVariable, constraintAnchor7.mTarget.mSolverVariable, i8, 5);
                } else {
                    z4 = z7;
                    constraintWidget12 = constraintWidget13;
                    linearSystem4.addGreaterThan(constraintAnchor7.mSolverVariable, constraintAnchor7.mTarget.mSolverVariable, i8, 6);
                }
                linearSystem4.addEquality(constraintAnchor7.mSolverVariable, constraintAnchor7.mTarget.mSolverVariable, i8, i5);
            } else {
                z4 = z7;
                constraintWidget12 = constraintWidget13;
            }
            if (z5) {
                if (constraintWidget20.getVisibility() == 8 || constraintWidget20.mListDimensionBehaviors[i] != DimensionBehaviour.MATCH_CONSTRAINT) {
                    i6 = 0;
                } else {
                    i6 = 0;
                    linearSystem4.addGreaterThan(constraintWidget20.mListAnchors[i2 + 1].mSolverVariable, constraintWidget20.mListAnchors[i2].mSolverVariable, 0, 5);
                }
                linearSystem4.addGreaterThan(constraintWidget20.mListAnchors[i2].mSolverVariable, constraintWidgetContainer2.mListAnchors[i2].mSolverVariable, i6, 6);
            }
            ConstraintAnchor constraintAnchor8 = constraintWidget20.mListAnchors[i2 + 1].mTarget;
            if (constraintAnchor8 != null) {
                ConstraintWidget constraintWidget22 = constraintAnchor8.mOwner;
                if (constraintWidget22.mListAnchors[i2].mTarget != null && constraintWidget22.mListAnchors[i2].mTarget.mOwner == constraintWidget20) {
                    constraintWidget21 = constraintWidget22;
                }
            }
            if (constraintWidget21 != null) {
                constraintWidget20 = constraintWidget21;
                z10 = z3;
            } else {
                z10 = true;
            }
            f = f2;
            constraintWidget17 = constraintWidget11;
            constraintWidget13 = constraintWidget12;
            z7 = z4;
        }
        ConstraintWidget constraintWidget23 = constraintWidget17;
        float f3 = f;
        boolean z11 = z7;
        ConstraintWidget constraintWidget24 = constraintWidget13;
        if (constraintWidget16 != null) {
            int i9 = i2 + 1;
            if (constraintWidget14.mListAnchors[i9].mTarget != null) {
                ConstraintAnchor constraintAnchor9 = constraintWidget16.mListAnchors[i9];
                linearSystem4.addLowerThan(constraintAnchor9.mSolverVariable, constraintWidget14.mListAnchors[i9].mTarget.mSolverVariable, -constraintAnchor9.getMargin(), 5);
                if (z5) {
                    int i10 = i2 + 1;
                    linearSystem4.addGreaterThan(constraintWidgetContainer2.mListAnchors[i10].mSolverVariable, constraintWidget14.mListAnchors[i10].mSolverVariable, constraintWidget14.mListAnchors[i10].getMargin(), 6);
                }
                arrayList = chainHead2.mWeightedMatchConstraintsWidgets;
                if (arrayList != null) {
                    int size = arrayList.size();
                    if (size > 1) {
                        if (chainHead2.mHasUndefinedWeights && !chainHead2.mHasComplexMatchWeights) {
                            f3 = (float) chainHead2.mWidgetsMatchCount;
                        }
                        float f4 = 0.0f;
                        ConstraintWidget constraintWidget25 = null;
                        int i11 = 0;
                        float f5 = 0.0f;
                        while (i11 < size) {
                            ConstraintWidget constraintWidget26 = (ConstraintWidget) arrayList.get(i11);
                            float f6 = constraintWidget26.mWeight[i];
                            if (f6 < f4) {
                                if (chainHead2.mHasComplexMatchWeights) {
                                    linearSystem4.addEquality(constraintWidget26.mListAnchors[i2 + 1].mSolverVariable, constraintWidget26.mListAnchors[i2].mSolverVariable, 0, 4);
                                    arrayList2 = arrayList;
                                    i11++;
                                    arrayList = arrayList2;
                                    f4 = 0.0f;
                                } else {
                                    f6 = 1.0f;
                                }
                            }
                            if (f6 == f4) {
                                linearSystem4.addEquality(constraintWidget26.mListAnchors[i2 + 1].mSolverVariable, constraintWidget26.mListAnchors[i2].mSolverVariable, 0, 6);
                                arrayList2 = arrayList;
                                i11++;
                                arrayList = arrayList2;
                                f4 = 0.0f;
                            } else {
                                if (constraintWidget25 != null) {
                                    SolverVariable solverVariable6 = constraintWidget25.mListAnchors[i2].mSolverVariable;
                                    int i12 = i2 + 1;
                                    SolverVariable solverVariable7 = constraintWidget25.mListAnchors[i12].mSolverVariable;
                                    SolverVariable solverVariable8 = constraintWidget26.mListAnchors[i2].mSolverVariable;
                                    SolverVariable solverVariable9 = constraintWidget26.mListAnchors[i12].mSolverVariable;
                                    arrayList2 = arrayList;
                                    ArrayRow createRow = linearSystem.createRow();
                                    createRow.createRowEqualMatchDimensions(f5, f3, f6, solverVariable6, solverVariable7, solverVariable8, solverVariable9);
                                    linearSystem4.addConstraint(createRow);
                                } else {
                                    arrayList2 = arrayList;
                                }
                                constraintWidget25 = constraintWidget26;
                                f5 = f6;
                                i11++;
                                arrayList = arrayList2;
                                f4 = 0.0f;
                            }
                        }
                    }
                }
                if (constraintWidget15 != null || (constraintWidget15 != constraintWidget16 && !z11)) {
                    constraintWidget = constraintWidget24;
                    if (z9 || constraintWidget15 == null) {
                        int i13 = 8;
                        if (z8 && constraintWidget15 != null) {
                            boolean z12 = chainHead2.mWidgetsMatchCount <= 0 && chainHead2.mWidgetsCount == chainHead2.mWidgetsMatchCount;
                            ConstraintWidget constraintWidget27 = constraintWidget15;
                            constraintWidget2 = constraintWidget27;
                            while (constraintWidget2 != null) {
                                ConstraintWidget constraintWidget28 = constraintWidget2.mNextChainWidget[i];
                                while (constraintWidget28 != null && constraintWidget28.getVisibility() == i13) {
                                    constraintWidget28 = constraintWidget28.mNextChainWidget[i];
                                }
                                if (constraintWidget2 == constraintWidget15 || constraintWidget2 == constraintWidget16 || constraintWidget28 == null) {
                                    constraintWidget3 = constraintWidget27;
                                    constraintWidget4 = constraintWidget2;
                                    constraintWidget2 = constraintWidget28;
                                } else {
                                    ConstraintWidget constraintWidget29 = constraintWidget28 == constraintWidget16 ? null : constraintWidget28;
                                    ConstraintAnchor constraintAnchor10 = constraintWidget2.mListAnchors[i2];
                                    SolverVariable solverVariable10 = constraintAnchor10.mSolverVariable;
                                    if (constraintAnchor10.mTarget != null) {
                                        SolverVariable solverVariable11 = constraintAnchor10.mTarget.mSolverVariable;
                                    }
                                    int i14 = i2 + 1;
                                    SolverVariable solverVariable12 = constraintWidget27.mListAnchors[i14].mSolverVariable;
                                    int margin2 = constraintAnchor10.getMargin();
                                    int margin3 = constraintWidget2.mListAnchors[i14].getMargin();
                                    if (constraintWidget29 != null) {
                                        constraintAnchor4 = constraintWidget29.mListAnchors[i2];
                                        constraintWidget5 = constraintWidget29;
                                        SolverVariable solverVariable13 = constraintAnchor4.mSolverVariable;
                                        solverVariable2 = constraintAnchor4.mTarget != null ? constraintAnchor4.mTarget.mSolverVariable : null;
                                        solverVariable3 = solverVariable13;
                                    } else {
                                        constraintWidget5 = constraintWidget29;
                                        constraintAnchor4 = constraintWidget2.mListAnchors[i14].mTarget;
                                        solverVariable3 = constraintAnchor4 != null ? constraintAnchor4.mSolverVariable : null;
                                        solverVariable2 = constraintWidget2.mListAnchors[i14].mSolverVariable;
                                    }
                                    if (constraintAnchor4 != null) {
                                        margin3 += constraintAnchor4.getMargin();
                                    }
                                    int i15 = margin3;
                                    if (constraintWidget27 != null) {
                                        margin2 += constraintWidget27.mListAnchors[i14].getMargin();
                                    }
                                    int i16 = margin2;
                                    int i17 = z12 ? 6 : 4;
                                    if (solverVariable10 == null || solverVariable12 == null || solverVariable3 == null || solverVariable2 == null) {
                                        constraintWidget3 = constraintWidget27;
                                        constraintWidget4 = constraintWidget2;
                                        constraintWidget6 = constraintWidget5;
                                    } else {
                                        SolverVariable solverVariable14 = solverVariable3;
                                        constraintWidget6 = constraintWidget5;
                                        SolverVariable solverVariable15 = solverVariable2;
                                        ConstraintWidget constraintWidget30 = constraintWidget27;
                                        int i18 = i15;
                                        constraintWidget4 = constraintWidget2;
                                        constraintWidget3 = constraintWidget30;
                                        linearSystem.addCentering(solverVariable10, solverVariable12, i16, 0.5f, solverVariable14, solverVariable15, i18, i17);
                                    }
                                    constraintWidget2 = constraintWidget6;
                                }
                                constraintWidget27 = constraintWidget4.getVisibility() != 8 ? constraintWidget4 : constraintWidget3;
                                i13 = 8;
                            }
                            ConstraintAnchor constraintAnchor11 = constraintWidget15.mListAnchors[i2];
                            constraintAnchor = constraintWidget.mListAnchors[i2].mTarget;
                            int i19 = i2 + 1;
                            constraintAnchor2 = constraintWidget16.mListAnchors[i19];
                            constraintAnchor3 = constraintWidget14.mListAnchors[i19].mTarget;
                            if (constraintAnchor == null) {
                                if (constraintWidget15 != constraintWidget16) {
                                    linearSystem3 = linearSystem;
                                    linearSystem3.addEquality(constraintAnchor11.mSolverVariable, constraintAnchor.mSolverVariable, constraintAnchor11.getMargin(), 5);
                                } else {
                                    linearSystem3 = linearSystem;
                                    if (constraintAnchor3 != null) {
                                        linearSystem2 = linearSystem3;
                                        linearSystem.addCentering(constraintAnchor11.mSolverVariable, constraintAnchor.mSolverVariable, constraintAnchor11.getMargin(), 0.5f, constraintAnchor2.mSolverVariable, constraintAnchor3.mSolverVariable, constraintAnchor2.getMargin(), 5);
                                    }
                                }
                                linearSystem2 = linearSystem3;
                            } else {
                                linearSystem2 = linearSystem;
                            }
                            if (!(constraintAnchor3 == null || constraintWidget15 == constraintWidget16)) {
                                linearSystem2.addEquality(constraintAnchor2.mSolverVariable, constraintAnchor3.mSolverVariable, -constraintAnchor2.getMargin(), 5);
                            }
                        }
                    } else {
                        boolean z13 = chainHead2.mWidgetsMatchCount > 0 && chainHead2.mWidgetsCount == chainHead2.mWidgetsMatchCount;
                        ConstraintWidget constraintWidget31 = constraintWidget15;
                        ConstraintWidget constraintWidget32 = constraintWidget31;
                        while (constraintWidget32 != null) {
                            ConstraintWidget constraintWidget33 = constraintWidget32.mNextChainWidget[i];
                            while (true) {
                                if (constraintWidget33 != null) {
                                    if (constraintWidget33.getVisibility() != 8) {
                                        break;
                                    }
                                    constraintWidget33 = constraintWidget33.mNextChainWidget[i];
                                } else {
                                    break;
                                }
                            }
                            if (constraintWidget33 != null || constraintWidget32 == constraintWidget16) {
                                ConstraintAnchor constraintAnchor12 = constraintWidget32.mListAnchors[i2];
                                SolverVariable solverVariable16 = constraintAnchor12.mSolverVariable;
                                SolverVariable solverVariable17 = constraintAnchor12.mTarget != null ? constraintAnchor12.mTarget.mSolverVariable : null;
                                if (constraintWidget31 != constraintWidget32) {
                                    solverVariable17 = constraintWidget31.mListAnchors[i2 + 1].mSolverVariable;
                                } else if (constraintWidget32 == constraintWidget15 && constraintWidget31 == constraintWidget32) {
                                    solverVariable17 = constraintWidget.mListAnchors[i2].mTarget != null ? constraintWidget.mListAnchors[i2].mTarget.mSolverVariable : null;
                                }
                                int margin4 = constraintAnchor12.getMargin();
                                int i20 = i2 + 1;
                                int margin5 = constraintWidget32.mListAnchors[i20].getMargin();
                                if (constraintWidget33 != null) {
                                    ConstraintAnchor constraintAnchor13 = constraintWidget33.mListAnchors[i2];
                                    constraintWidget10 = constraintWidget33;
                                    solverVariable4 = constraintAnchor13.mSolverVariable;
                                    constraintAnchor6 = constraintAnchor13;
                                    solverVariable5 = constraintWidget32.mListAnchors[i20].mSolverVariable;
                                } else {
                                    constraintWidget10 = constraintWidget33;
                                    ConstraintAnchor constraintAnchor14 = constraintWidget14.mListAnchors[i20].mTarget;
                                    if (constraintAnchor14 != null) {
                                        solverVariable4 = constraintAnchor14.mSolverVariable;
                                        constraintAnchor5 = constraintAnchor14;
                                    } else {
                                        constraintAnchor5 = constraintAnchor14;
                                        solverVariable4 = null;
                                    }
                                    solverVariable5 = constraintWidget32.mListAnchors[i20].mSolverVariable;
                                    constraintAnchor6 = constraintAnchor5;
                                }
                                SolverVariable solverVariable18 = solverVariable4;
                                SolverVariable solverVariable19 = solverVariable5;
                                SolverVariable solverVariable20 = solverVariable18;
                                if (constraintAnchor6 != null) {
                                    margin5 += constraintAnchor6.getMargin();
                                }
                                if (constraintWidget31 != null) {
                                    i4 = margin5;
                                    margin4 += constraintWidget31.mListAnchors[i20].getMargin();
                                } else {
                                    i4 = margin5;
                                }
                                if (solverVariable16 == null || solverVariable17 == null || solverVariable20 == null || solverVariable19 == null) {
                                    constraintWidget7 = constraintWidget31;
                                    constraintWidget9 = constraintWidget32;
                                    constraintWidget8 = constraintWidget10;
                                } else {
                                    if (constraintWidget32 == constraintWidget15) {
                                        margin4 = constraintWidget15.mListAnchors[i2].getMargin();
                                    }
                                    int i21 = margin4;
                                    if (constraintWidget32 == constraintWidget16) {
                                        i4 = constraintWidget16.mListAnchors[i20].getMargin();
                                    }
                                    constraintWidget8 = constraintWidget10;
                                    constraintWidget7 = constraintWidget31;
                                    constraintWidget9 = constraintWidget32;
                                    i3 = 8;
                                    linearSystem.addCentering(solverVariable16, solverVariable17, i21, 0.5f, solverVariable20, solverVariable19, i4, z13 ? 6 : 4);
                                    constraintWidget31 = constraintWidget9.getVisibility() == i3 ? constraintWidget9 : constraintWidget7;
                                    constraintWidget32 = constraintWidget8;
                                    LinearSystem linearSystem5 = linearSystem;
                                }
                            } else {
                                constraintWidget8 = constraintWidget33;
                                constraintWidget7 = constraintWidget31;
                                constraintWidget9 = constraintWidget32;
                            }
                            i3 = 8;
                            if (constraintWidget9.getVisibility() == i3) {
                            }
                            constraintWidget32 = constraintWidget8;
                            LinearSystem linearSystem52 = linearSystem;
                        }
                    }
                    LinearSystem linearSystem6 = linearSystem;
                } else {
                    ConstraintWidget constraintWidget34 = constraintWidget24;
                    ConstraintAnchor constraintAnchor15 = constraintWidget34.mListAnchors[i2];
                    int i22 = i2 + 1;
                    ConstraintAnchor constraintAnchor16 = constraintWidget14.mListAnchors[i22];
                    SolverVariable solverVariable21 = constraintWidget34.mListAnchors[i2].mTarget != null ? constraintWidget34.mListAnchors[i2].mTarget.mSolverVariable : null;
                    SolverVariable solverVariable22 = constraintWidget14.mListAnchors[i22].mTarget != null ? constraintWidget14.mListAnchors[i22].mTarget.mSolverVariable : null;
                    if (constraintWidget15 == constraintWidget16) {
                        constraintAnchor15 = constraintWidget15.mListAnchors[i2];
                        constraintAnchor16 = constraintWidget15.mListAnchors[i22];
                    }
                    if (!(solverVariable21 == null || solverVariable22 == null)) {
                        linearSystem.addCentering(constraintAnchor15.mSolverVariable, solverVariable21, constraintAnchor15.getMargin(), i == 0 ? constraintWidget23.mHorizontalBiasPercent : constraintWidget23.mVerticalBiasPercent, solverVariable22, constraintAnchor16.mSolverVariable, constraintAnchor16.getMargin(), 5);
                    }
                }
                if ((!z9 || z8) && constraintWidget15 != null) {
                    ConstraintAnchor constraintAnchor17 = constraintWidget15.mListAnchors[i2];
                    int i23 = i2 + 1;
                    ConstraintAnchor constraintAnchor18 = constraintWidget16.mListAnchors[i23];
                    solverVariable = constraintAnchor17.mTarget == null ? constraintAnchor17.mTarget.mSolverVariable : null;
                    SolverVariable solverVariable23 = constraintAnchor18.mTarget == null ? constraintAnchor18.mTarget.mSolverVariable : null;
                    if (constraintWidget14 != constraintWidget16) {
                        ConstraintAnchor constraintAnchor19 = constraintWidget14.mListAnchors[i23];
                        solverVariable23 = constraintAnchor19.mTarget != null ? constraintAnchor19.mTarget.mSolverVariable : null;
                    }
                    SolverVariable solverVariable24 = solverVariable23;
                    if (constraintWidget15 == constraintWidget16) {
                        constraintAnchor17 = constraintWidget15.mListAnchors[i2];
                        constraintAnchor18 = constraintWidget15.mListAnchors[i23];
                    }
                    if (solverVariable != null && solverVariable24 != null) {
                        int margin6 = constraintAnchor17.getMargin();
                        if (constraintWidget16 != null) {
                            constraintWidget14 = constraintWidget16;
                        }
                        linearSystem.addCentering(constraintAnchor17.mSolverVariable, solverVariable, margin6, 0.5f, solverVariable24, constraintAnchor18.mSolverVariable, constraintWidget14.mListAnchors[i23].getMargin(), 5);
                        return;
                    }
                }
                return;
            }
        }
        if (z5) {
        }
        arrayList = chainHead2.mWeightedMatchConstraintsWidgets;
        if (arrayList != null) {
        }
        if (constraintWidget15 != null) {
        }
        constraintWidget = constraintWidget24;
        if (z9) {
        }
        int i132 = 8;
        if (chainHead2.mWidgetsMatchCount <= 0) {
        }
        ConstraintWidget constraintWidget272 = constraintWidget15;
        constraintWidget2 = constraintWidget272;
        while (constraintWidget2 != null) {
        }
        ConstraintAnchor constraintAnchor112 = constraintWidget15.mListAnchors[i2];
        constraintAnchor = constraintWidget.mListAnchors[i2].mTarget;
        int i192 = i2 + 1;
        constraintAnchor2 = constraintWidget16.mListAnchors[i192];
        constraintAnchor3 = constraintWidget14.mListAnchors[i192].mTarget;
        if (constraintAnchor == null) {
        }
        linearSystem2.addEquality(constraintAnchor2.mSolverVariable, constraintAnchor3.mSolverVariable, -constraintAnchor2.getMargin(), 5);
        if (!z9) {
        }
        ConstraintAnchor constraintAnchor172 = constraintWidget15.mListAnchors[i2];
        int i232 = i2 + 1;
        ConstraintAnchor constraintAnchor182 = constraintWidget16.mListAnchors[i232];
        if (constraintAnchor172.mTarget == null) {
        }
        if (constraintAnchor182.mTarget == null) {
        }
        if (constraintWidget14 != constraintWidget16) {
        }
        SolverVariable solverVariable242 = solverVariable23;
        if (constraintWidget15 == constraintWidget16) {
        }
        if (solverVariable != null) {
        }
    }
}
