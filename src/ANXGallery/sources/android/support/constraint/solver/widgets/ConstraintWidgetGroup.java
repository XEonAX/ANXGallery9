package android.support.constraint.solver.widgets;

import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ConstraintWidgetGroup {
    public List<ConstraintWidget> mConstrainedGroup;
    public final int[] mGroupDimensions = {this.mGroupWidth, this.mGroupHeight};
    int mGroupHeight = -1;
    int mGroupWidth = -1;
    public boolean mSkipSolver = false;
    List<ConstraintWidget> mStartHorizontalWidgets = new ArrayList();
    List<ConstraintWidget> mStartVerticalWidgets = new ArrayList();
    List<ConstraintWidget> mUnresolvedWidgets = new ArrayList();
    HashSet<ConstraintWidget> mWidgetsToSetHorizontal = new HashSet<>();
    HashSet<ConstraintWidget> mWidgetsToSetVertical = new HashSet<>();
    List<ConstraintWidget> mWidgetsToSolve = new ArrayList();

    ConstraintWidgetGroup(List<ConstraintWidget> list) {
        this.mConstrainedGroup = list;
    }

    ConstraintWidgetGroup(List<ConstraintWidget> list, boolean z) {
        this.mConstrainedGroup = list;
        this.mSkipSolver = z;
    }

    private void getWidgetsToSolveTraversal(ArrayList<ConstraintWidget> arrayList, ConstraintWidget constraintWidget) {
        if (!constraintWidget.mGroupsToSolver) {
            arrayList.add(constraintWidget);
            constraintWidget.mGroupsToSolver = true;
            if (!constraintWidget.isFullyResolved()) {
                if (constraintWidget instanceof Helper) {
                    Helper helper = (Helper) constraintWidget;
                    int i = helper.mWidgetsCount;
                    for (int i2 = 0; i2 < i; i2++) {
                        getWidgetsToSolveTraversal(arrayList, helper.mWidgets[i2]);
                    }
                }
                for (ConstraintAnchor constraintAnchor : constraintWidget.mListAnchors) {
                    ConstraintAnchor constraintAnchor2 = constraintAnchor.mTarget;
                    if (constraintAnchor2 != null) {
                        ConstraintWidget constraintWidget2 = constraintAnchor2.mOwner;
                        if (!(constraintAnchor2 == null || constraintWidget2 == constraintWidget.getParent())) {
                            getWidgetsToSolveTraversal(arrayList, constraintWidget2);
                        }
                    }
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x004e  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0056  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0071  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x0095  */
    private void updateResolvedDimension(ConstraintWidget constraintWidget) {
        int i;
        if (constraintWidget.mOptimizerMeasurable && !constraintWidget.isFullyResolved()) {
            boolean z = false;
            boolean z2 = constraintWidget.mRight.mTarget != null;
            ConstraintAnchor constraintAnchor = z2 ? constraintWidget.mRight.mTarget : constraintWidget.mLeft.mTarget;
            if (constraintAnchor != null) {
                if (!constraintAnchor.mOwner.mOptimizerMeasured) {
                    updateResolvedDimension(constraintAnchor.mOwner);
                }
                if (constraintAnchor.mType == Type.RIGHT) {
                    i = constraintAnchor.mOwner.getWidth() + constraintAnchor.mOwner.mX;
                } else if (constraintAnchor.mType == Type.LEFT) {
                    i = constraintAnchor.mOwner.mX;
                }
                int margin = !z2 ? i - constraintWidget.mRight.getMargin() : i + constraintWidget.mLeft.getMargin() + constraintWidget.getWidth();
                constraintWidget.setHorizontalDimension(margin - constraintWidget.getWidth(), margin);
                if (constraintWidget.mBaseline.mTarget == null) {
                    ConstraintAnchor constraintAnchor2 = constraintWidget.mBaseline.mTarget;
                    if (!constraintAnchor2.mOwner.mOptimizerMeasured) {
                        updateResolvedDimension(constraintAnchor2.mOwner);
                    }
                    int i2 = (constraintAnchor2.mOwner.mY + constraintAnchor2.mOwner.mBaselineDistance) - constraintWidget.mBaselineDistance;
                    constraintWidget.setVerticalDimension(i2, constraintWidget.mHeight + i2);
                    constraintWidget.mOptimizerMeasured = true;
                    return;
                }
                if (constraintWidget.mBottom.mTarget != null) {
                    z = true;
                }
                ConstraintAnchor constraintAnchor3 = z ? constraintWidget.mBottom.mTarget : constraintWidget.mTop.mTarget;
                if (constraintAnchor3 != null) {
                    if (!constraintAnchor3.mOwner.mOptimizerMeasured) {
                        updateResolvedDimension(constraintAnchor3.mOwner);
                    }
                    if (constraintAnchor3.mType == Type.BOTTOM) {
                        margin = constraintAnchor3.mOwner.mY + constraintAnchor3.mOwner.getHeight();
                    } else if (constraintAnchor3.mType == Type.TOP) {
                        margin = constraintAnchor3.mOwner.mY;
                    }
                }
                int margin2 = z ? margin - constraintWidget.mBottom.getMargin() : margin + constraintWidget.mTop.getMargin() + constraintWidget.getHeight();
                constraintWidget.setVerticalDimension(margin2 - constraintWidget.getHeight(), margin2);
                constraintWidget.mOptimizerMeasured = true;
                return;
            }
            i = 0;
            if (!z2) {
            }
            constraintWidget.setHorizontalDimension(margin - constraintWidget.getWidth(), margin);
            if (constraintWidget.mBaseline.mTarget == null) {
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void addWidgetsToSet(ConstraintWidget constraintWidget, int i) {
        if (i == 0) {
            this.mWidgetsToSetHorizontal.add(constraintWidget);
        } else if (i == 1) {
            this.mWidgetsToSetVertical.add(constraintWidget);
        }
    }

    public List<ConstraintWidget> getStartWidgets(int i) {
        if (i == 0) {
            return this.mStartHorizontalWidgets;
        }
        if (i == 1) {
            return this.mStartVerticalWidgets;
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public Set<ConstraintWidget> getWidgetsToSet(int i) {
        if (i == 0) {
            return this.mWidgetsToSetHorizontal;
        }
        if (i == 1) {
            return this.mWidgetsToSetVertical;
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public List<ConstraintWidget> getWidgetsToSolve() {
        if (!this.mWidgetsToSolve.isEmpty()) {
            return this.mWidgetsToSolve;
        }
        int size = this.mConstrainedGroup.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mConstrainedGroup.get(i);
            if (!constraintWidget.mOptimizerMeasurable) {
                getWidgetsToSolveTraversal((ArrayList) this.mWidgetsToSolve, constraintWidget);
            }
        }
        this.mUnresolvedWidgets.clear();
        this.mUnresolvedWidgets.addAll(this.mConstrainedGroup);
        this.mUnresolvedWidgets.removeAll(this.mWidgetsToSolve);
        return this.mWidgetsToSolve;
    }

    /* access modifiers changed from: 0000 */
    public void updateUnresolvedWidgets() {
        int size = this.mUnresolvedWidgets.size();
        for (int i = 0; i < size; i++) {
            updateResolvedDimension((ConstraintWidget) this.mUnresolvedWidgets.get(i));
        }
    }
}
