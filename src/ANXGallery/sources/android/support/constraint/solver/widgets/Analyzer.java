package android.support.constraint.solver.widgets;

import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Analyzer {
    public static void determineGroups(ConstraintWidgetContainer constraintWidgetContainer) {
        if ((constraintWidgetContainer.getOptimizationLevel() & 32) != 32) {
            singleGroup(constraintWidgetContainer);
            return;
        }
        constraintWidgetContainer.mSkipSolver = true;
        constraintWidgetContainer.mGroupsWrapOptimized = false;
        constraintWidgetContainer.mHorizontalWrapOptimized = false;
        constraintWidgetContainer.mVerticalWrapOptimized = false;
        ArrayList<ConstraintWidget> arrayList = constraintWidgetContainer.mChildren;
        List<ConstraintWidgetGroup> list = constraintWidgetContainer.mWidgetGroups;
        boolean z = constraintWidgetContainer.getHorizontalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT;
        boolean z2 = constraintWidgetContainer.getVerticalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT;
        boolean z3 = z || z2;
        list.clear();
        for (ConstraintWidget constraintWidget : arrayList) {
            constraintWidget.mBelongingGroup = null;
            constraintWidget.mGroupsToSolver = false;
            constraintWidget.resetResolutionNodes();
        }
        for (ConstraintWidget constraintWidget2 : arrayList) {
            if (constraintWidget2.mBelongingGroup == null && !determineGroups(constraintWidget2, list, z3)) {
                singleGroup(constraintWidgetContainer);
                constraintWidgetContainer.mSkipSolver = false;
                return;
            }
        }
        int i = 0;
        int i2 = 0;
        for (ConstraintWidgetGroup constraintWidgetGroup : list) {
            i = Math.max(i, getMaxDimension(constraintWidgetGroup, 0));
            i2 = Math.max(i2, getMaxDimension(constraintWidgetGroup, 1));
        }
        if (z) {
            constraintWidgetContainer.setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
            constraintWidgetContainer.setWidth(i);
            constraintWidgetContainer.mGroupsWrapOptimized = true;
            constraintWidgetContainer.mHorizontalWrapOptimized = true;
            constraintWidgetContainer.mWrapFixedWidth = i;
        }
        if (z2) {
            constraintWidgetContainer.setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
            constraintWidgetContainer.setHeight(i2);
            constraintWidgetContainer.mGroupsWrapOptimized = true;
            constraintWidgetContainer.mVerticalWrapOptimized = true;
            constraintWidgetContainer.mWrapFixedHeight = i2;
        }
        setPosition(list, 0, constraintWidgetContainer.getWidth());
        setPosition(list, 1, constraintWidgetContainer.getHeight());
    }

    private static boolean determineGroups(ConstraintWidget constraintWidget, List<ConstraintWidgetGroup> list, boolean z) {
        ConstraintWidgetGroup constraintWidgetGroup = new ConstraintWidgetGroup(new ArrayList(), true);
        list.add(constraintWidgetGroup);
        return traverse(constraintWidget, constraintWidgetGroup, list, z);
    }

    private static int getMaxDimension(ConstraintWidgetGroup constraintWidgetGroup, int i) {
        int i2 = i * 2;
        List startWidgets = constraintWidgetGroup.getStartWidgets(i);
        int size = startWidgets.size();
        int i3 = 0;
        for (int i4 = 0; i4 < size; i4++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) startWidgets.get(i4);
            int i5 = i2 + 1;
            i3 = Math.max(i3, getMaxDimensionTraversal(constraintWidget, i, constraintWidget.mListAnchors[i5].mTarget == null || !(constraintWidget.mListAnchors[i2].mTarget == null || constraintWidget.mListAnchors[i5].mTarget == null), 0));
        }
        constraintWidgetGroup.mGroupDimensions[i] = i3;
        return i3;
    }

    private static int getMaxDimensionTraversal(ConstraintWidget constraintWidget, int i, boolean z, int i2) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int width;
        int i9;
        int i10;
        int i11;
        ConstraintWidget constraintWidget2 = constraintWidget;
        int i12 = i;
        boolean z2 = z;
        int i13 = 0;
        if (!constraintWidget2.mOptimizerMeasurable) {
            return 0;
        }
        boolean z3 = constraintWidget2.mBaseline.mTarget != null && i12 == 1;
        if (z2) {
            i6 = constraintWidget.getBaselineDistance();
            i5 = constraintWidget.getHeight() - constraintWidget.getBaselineDistance();
            i4 = i12 * 2;
            i3 = i4 + 1;
        } else {
            i6 = constraintWidget.getHeight() - constraintWidget.getBaselineDistance();
            i5 = constraintWidget.getBaselineDistance();
            i3 = i12 * 2;
            i4 = i3 + 1;
        }
        if (constraintWidget2.mListAnchors[i3].mTarget == null || constraintWidget2.mListAnchors[i4].mTarget != null) {
            i7 = i3;
            i8 = 1;
        } else {
            i7 = i4;
            i4 = i3;
            i8 = -1;
        }
        int margin = (constraintWidget2.mListAnchors[i4].getMargin() * i8) + getParentBiasOffset(constraintWidget, i);
        int i14 = (z3 ? i2 - i6 : i2) + margin;
        int width2 = (i12 == 0 ? constraintWidget.getWidth() : constraintWidget.getHeight()) * i8;
        Iterator it = constraintWidget2.mListAnchors[i4].getResolutionNode().dependents.iterator();
        while (it.hasNext()) {
            i13 = Math.max(i13, getMaxDimensionTraversal(((ResolutionAnchor) ((ResolutionNode) it.next())).myAnchor.mOwner, i12, z2, i14));
        }
        Iterator it2 = constraintWidget2.mListAnchors[i7].getResolutionNode().dependents.iterator();
        int i15 = 0;
        while (it2.hasNext()) {
            Iterator it3 = it2;
            i15 = Math.max(i15, getMaxDimensionTraversal(((ResolutionAnchor) ((ResolutionNode) it2.next())).myAnchor.mOwner, i12, z2, width2 + i14));
            it2 = it3;
        }
        if (z3) {
            i13 -= i6;
            width = i15 + i5;
        } else {
            width = i15 + ((i12 == 0 ? constraintWidget.getWidth() : constraintWidget.getHeight()) * i8);
        }
        int i16 = 1;
        if (i12 == 1) {
            Iterator it4 = constraintWidget2.mBaseline.getResolutionNode().dependents.iterator();
            int i17 = 0;
            while (it4.hasNext()) {
                Iterator it5 = it4;
                ResolutionAnchor resolutionAnchor = (ResolutionAnchor) ((ResolutionNode) it4.next());
                if (i8 == i16) {
                    i17 = Math.max(i17, getMaxDimensionTraversal(resolutionAnchor.myAnchor.mOwner, i12, z2, i6 + i14));
                    i11 = i7;
                } else {
                    i11 = i7;
                    i17 = Math.max(i17, getMaxDimensionTraversal(resolutionAnchor.myAnchor.mOwner, i12, z2, (i5 * i8) + i14));
                }
                it4 = it5;
                i7 = i11;
                i16 = 1;
            }
            i9 = i7;
            int i18 = i17;
            i10 = (constraintWidget2.mBaseline.getResolutionNode().dependents.size() <= 0 || z3) ? i18 : i8 == 1 ? i18 + i6 : i18 - i5;
        } else {
            i9 = i7;
            i10 = 0;
        }
        int max = margin + Math.max(i13, Math.max(width, i10));
        int i19 = i14 + width2;
        if (i8 == -1) {
            int i20 = i14;
            i14 = i19;
            i19 = i20;
        }
        if (z2) {
            Optimizer.setOptimizedWidget(constraintWidget2, i12, i14);
            constraintWidget2.setFrame(i14, i19, i12);
        } else {
            constraintWidget2.mBelongingGroup.addWidgetsToSet(constraintWidget2, i12);
            constraintWidget2.setRelativePositioning(i14, i12);
        }
        if (constraintWidget.getDimensionBehaviour(i) == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget2.mDimensionRatio != 0.0f) {
            constraintWidget2.mBelongingGroup.addWidgetsToSet(constraintWidget2, i12);
        }
        if (!(constraintWidget2.mListAnchors[i4].mTarget == null || constraintWidget2.mListAnchors[i9].mTarget == null)) {
            ConstraintWidget parent = constraintWidget.getParent();
            if (constraintWidget2.mListAnchors[i4].mTarget.mOwner == parent && constraintWidget2.mListAnchors[i9].mTarget.mOwner == parent) {
                constraintWidget2.mBelongingGroup.addWidgetsToSet(constraintWidget2, i12);
            }
        }
        return max;
    }

    private static int getParentBiasOffset(ConstraintWidget constraintWidget, int i) {
        int i2 = i * 2;
        ConstraintAnchor constraintAnchor = constraintWidget.mListAnchors[i2];
        ConstraintAnchor constraintAnchor2 = constraintWidget.mListAnchors[i2 + 1];
        if (constraintAnchor.mTarget == null || constraintAnchor.mTarget.mOwner != constraintWidget.mParent || constraintAnchor2.mTarget == null || constraintAnchor2.mTarget.mOwner != constraintWidget.mParent) {
            return 0;
        }
        return (int) (((float) (((constraintWidget.mParent.getLength(i) - constraintAnchor.getMargin()) - constraintAnchor2.getMargin()) - constraintWidget.getLength(i))) * (i == 0 ? constraintWidget.mHorizontalBiasPercent : constraintWidget.mVerticalBiasPercent));
    }

    private static void invalidate(ConstraintWidgetContainer constraintWidgetContainer, ConstraintWidget constraintWidget, ConstraintWidgetGroup constraintWidgetGroup) {
        constraintWidgetGroup.mSkipSolver = false;
        constraintWidgetContainer.mSkipSolver = false;
        constraintWidget.mOptimizerMeasurable = false;
    }

    private static int resolveDimensionRatio(ConstraintWidget constraintWidget) {
        if (constraintWidget.getHorizontalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) {
            int height = constraintWidget.mDimensionRatioSide == 0 ? (int) (((float) constraintWidget.getHeight()) * constraintWidget.mDimensionRatio) : (int) (((float) constraintWidget.getHeight()) / constraintWidget.mDimensionRatio);
            constraintWidget.setWidth(height);
            return height;
        } else if (constraintWidget.getVerticalDimensionBehaviour() != DimensionBehaviour.MATCH_CONSTRAINT) {
            return -1;
        } else {
            int width = constraintWidget.mDimensionRatioSide == 1 ? (int) (((float) constraintWidget.getWidth()) * constraintWidget.mDimensionRatio) : (int) (((float) constraintWidget.getWidth()) / constraintWidget.mDimensionRatio);
            constraintWidget.setHeight(width);
            return width;
        }
    }

    private static void setConnection(ConstraintAnchor constraintAnchor) {
        ResolutionAnchor resolutionNode = constraintAnchor.getResolutionNode();
        if (constraintAnchor.mTarget != null && constraintAnchor.mTarget.mTarget != constraintAnchor) {
            constraintAnchor.mTarget.getResolutionNode().addDependent(resolutionNode);
        }
    }

    public static void setPosition(List<ConstraintWidgetGroup> list, int i, int i2) {
        int size = list.size();
        for (int i3 = 0; i3 < size; i3++) {
            for (ConstraintWidget constraintWidget : ((ConstraintWidgetGroup) list.get(i3)).getWidgetsToSet(i)) {
                if (constraintWidget.mOptimizerMeasurable) {
                    updateSizeDependentWidgets(constraintWidget, i, i2);
                }
            }
        }
    }

    private static void singleGroup(ConstraintWidgetContainer constraintWidgetContainer) {
        constraintWidgetContainer.mWidgetGroups.clear();
        constraintWidgetContainer.mWidgetGroups.add(0, new ConstraintWidgetGroup(constraintWidgetContainer.mChildren));
    }

    private static boolean traverse(ConstraintWidget constraintWidget, ConstraintWidgetGroup constraintWidgetGroup, List<ConstraintWidgetGroup> list, boolean z) {
        if (constraintWidget == null) {
            return true;
        }
        constraintWidget.mOptimizerMeasured = false;
        ConstraintWidgetContainer constraintWidgetContainer = (ConstraintWidgetContainer) constraintWidget.getParent();
        if (constraintWidget.mBelongingGroup == null) {
            constraintWidget.mOptimizerMeasurable = true;
            constraintWidgetGroup.mConstrainedGroup.add(constraintWidget);
            constraintWidget.mBelongingGroup = constraintWidgetGroup;
            if (constraintWidget.mLeft.mTarget == null && constraintWidget.mRight.mTarget == null && constraintWidget.mTop.mTarget == null && constraintWidget.mBottom.mTarget == null && constraintWidget.mBaseline.mTarget == null && constraintWidget.mCenter.mTarget == null) {
                invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                if (z) {
                    return false;
                }
            }
            if (!(constraintWidget.mTop.mTarget == null || constraintWidget.mBottom.mTarget == null)) {
                DimensionBehaviour verticalDimensionBehaviour = constraintWidgetContainer.getVerticalDimensionBehaviour();
                DimensionBehaviour dimensionBehaviour = DimensionBehaviour.WRAP_CONTENT;
                if (z) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                    return false;
                } else if (!(constraintWidget.mTop.mTarget.mOwner == constraintWidget.getParent() && constraintWidget.mBottom.mTarget.mOwner == constraintWidget.getParent())) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                }
            }
            if (!(constraintWidget.mLeft.mTarget == null || constraintWidget.mRight.mTarget == null)) {
                DimensionBehaviour horizontalDimensionBehaviour = constraintWidgetContainer.getHorizontalDimensionBehaviour();
                DimensionBehaviour dimensionBehaviour2 = DimensionBehaviour.WRAP_CONTENT;
                if (z) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                    return false;
                } else if (!(constraintWidget.mLeft.mTarget.mOwner == constraintWidget.getParent() && constraintWidget.mRight.mTarget.mOwner == constraintWidget.getParent())) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                }
            }
            if (((constraintWidget.getHorizontalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) ^ (constraintWidget.getVerticalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT)) && constraintWidget.mDimensionRatio != 0.0f) {
                resolveDimensionRatio(constraintWidget);
            } else if (constraintWidget.getHorizontalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT || constraintWidget.getVerticalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) {
                invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                if (z) {
                    return false;
                }
            }
            if (((constraintWidget.mLeft.mTarget == null && constraintWidget.mRight.mTarget == null) || ((constraintWidget.mLeft.mTarget != null && constraintWidget.mLeft.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mRight.mTarget == null) || ((constraintWidget.mRight.mTarget != null && constraintWidget.mRight.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mLeft.mTarget == null) || (constraintWidget.mLeft.mTarget != null && constraintWidget.mLeft.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mRight.mTarget != null && constraintWidget.mRight.mTarget.mOwner == constraintWidget.mParent)))) && constraintWidget.mCenter.mTarget == null && !(constraintWidget instanceof Guideline) && !(constraintWidget instanceof Helper)) {
                constraintWidgetGroup.mStartHorizontalWidgets.add(constraintWidget);
            }
            if (((constraintWidget.mTop.mTarget == null && constraintWidget.mBottom.mTarget == null) || ((constraintWidget.mTop.mTarget != null && constraintWidget.mTop.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mBottom.mTarget == null) || ((constraintWidget.mBottom.mTarget != null && constraintWidget.mBottom.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mTop.mTarget == null) || (constraintWidget.mTop.mTarget != null && constraintWidget.mTop.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mBottom.mTarget != null && constraintWidget.mBottom.mTarget.mOwner == constraintWidget.mParent)))) && constraintWidget.mCenter.mTarget == null && constraintWidget.mBaseline.mTarget == null && !(constraintWidget instanceof Guideline) && !(constraintWidget instanceof Helper)) {
                constraintWidgetGroup.mStartVerticalWidgets.add(constraintWidget);
            }
            if (constraintWidget instanceof Helper) {
                invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                if (z) {
                    return false;
                }
                Helper helper = (Helper) constraintWidget;
                for (int i = 0; i < helper.mWidgetsCount; i++) {
                    if (!traverse(helper.mWidgets[i], constraintWidgetGroup, list, z)) {
                        return false;
                    }
                }
            }
            for (ConstraintAnchor constraintAnchor : constraintWidget.mListAnchors) {
                if (!(constraintAnchor.mTarget == null || constraintAnchor.mTarget.mOwner == constraintWidget.getParent())) {
                    if (constraintAnchor.mType == Type.CENTER) {
                        invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                        if (z) {
                            return false;
                        }
                    } else {
                        setConnection(constraintAnchor);
                    }
                    if (!traverse(constraintAnchor.mTarget.mOwner, constraintWidgetGroup, list, z)) {
                        return false;
                    }
                }
            }
            return true;
        }
        if (constraintWidget.mBelongingGroup != constraintWidgetGroup) {
            constraintWidgetGroup.mConstrainedGroup.addAll(constraintWidget.mBelongingGroup.mConstrainedGroup);
            constraintWidgetGroup.mStartHorizontalWidgets.addAll(constraintWidget.mBelongingGroup.mStartHorizontalWidgets);
            constraintWidgetGroup.mStartVerticalWidgets.addAll(constraintWidget.mBelongingGroup.mStartVerticalWidgets);
            if (!constraintWidget.mBelongingGroup.mSkipSolver) {
                constraintWidgetGroup.mSkipSolver = false;
            }
            list.remove(constraintWidget.mBelongingGroup);
            for (ConstraintWidget constraintWidget2 : constraintWidget.mBelongingGroup.mConstrainedGroup) {
                constraintWidget2.mBelongingGroup = constraintWidgetGroup;
            }
        }
        return true;
    }

    private static void updateSizeDependentWidgets(ConstraintWidget constraintWidget, int i, int i2) {
        int i3 = i * 2;
        ConstraintAnchor constraintAnchor = constraintWidget.mListAnchors[i3];
        ConstraintAnchor constraintAnchor2 = constraintWidget.mListAnchors[i3 + 1];
        if ((constraintAnchor.mTarget == null || constraintAnchor2.mTarget == null) ? false : true) {
            Optimizer.setOptimizedWidget(constraintWidget, i, getParentBiasOffset(constraintWidget, i) + constraintAnchor.getMargin());
        } else if (constraintWidget.mDimensionRatio == 0.0f || constraintWidget.getDimensionBehaviour(i) != DimensionBehaviour.MATCH_CONSTRAINT) {
            int relativePositioning = i2 - constraintWidget.getRelativePositioning(i);
            int length = relativePositioning - constraintWidget.getLength(i);
            constraintWidget.setFrame(length, relativePositioning, i);
            Optimizer.setOptimizedWidget(constraintWidget, i, length);
        } else {
            int resolveDimensionRatio = resolveDimensionRatio(constraintWidget);
            int i4 = (int) constraintWidget.mListAnchors[i3].getResolutionNode().resolvedOffset;
            int i5 = i4 + resolveDimensionRatio;
            constraintAnchor2.getResolutionNode().resolvedTarget = constraintAnchor.getResolutionNode();
            constraintAnchor2.getResolutionNode().resolvedOffset = (float) resolveDimensionRatio;
            constraintAnchor2.getResolutionNode().state = 1;
            constraintWidget.setFrame(i4, i5, i);
        }
    }
}
