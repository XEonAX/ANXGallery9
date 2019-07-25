package android.support.constraint.solver.widgets;

import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.Metrics;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintAnchor.Type;

public class ResolutionAnchor extends ResolutionNode {
    float computedValue;
    private ResolutionDimension dimension = null;
    private int dimensionMultiplier = 1;
    ConstraintAnchor myAnchor;
    float offset;
    private ResolutionAnchor opposite;
    private ResolutionDimension oppositeDimension = null;
    private int oppositeDimensionMultiplier = 1;
    private float oppositeOffset;
    float resolvedOffset;
    ResolutionAnchor resolvedTarget;
    ResolutionAnchor target;
    int type = 0;

    public ResolutionAnchor(ConstraintAnchor constraintAnchor) {
        this.myAnchor = constraintAnchor;
    }

    /* access modifiers changed from: 0000 */
    public void addResolvedValue(LinearSystem linearSystem) {
        SolverVariable solverVariable = this.myAnchor.getSolverVariable();
        if (this.resolvedTarget == null) {
            linearSystem.addEquality(solverVariable, (int) (this.resolvedOffset + 0.5f));
        } else {
            linearSystem.addEquality(solverVariable, linearSystem.createObjectVariable(this.resolvedTarget.myAnchor), (int) (this.resolvedOffset + 0.5f), 6);
        }
    }

    public void dependsOn(int i, ResolutionAnchor resolutionAnchor, int i2) {
        this.type = i;
        this.target = resolutionAnchor;
        this.offset = (float) i2;
        this.target.addDependent(this);
    }

    public void dependsOn(ResolutionAnchor resolutionAnchor, int i) {
        this.target = resolutionAnchor;
        this.offset = (float) i;
        this.target.addDependent(this);
    }

    public void dependsOn(ResolutionAnchor resolutionAnchor, int i, ResolutionDimension resolutionDimension) {
        this.target = resolutionAnchor;
        this.target.addDependent(this);
        this.dimension = resolutionDimension;
        this.dimensionMultiplier = i;
        this.dimension.addDependent(this);
    }

    public float getResolvedValue() {
        return this.resolvedOffset;
    }

    public void reset() {
        super.reset();
        this.target = null;
        this.offset = 0.0f;
        this.dimension = null;
        this.dimensionMultiplier = 1;
        this.oppositeDimension = null;
        this.oppositeDimensionMultiplier = 1;
        this.resolvedTarget = null;
        this.resolvedOffset = 0.0f;
        this.computedValue = 0.0f;
        this.opposite = null;
        this.oppositeOffset = 0.0f;
        this.type = 0;
    }

    public void resolve() {
        float f;
        float f2;
        boolean z = true;
        if (this.state != 1 && this.type != 4) {
            if (this.dimension != null) {
                if (this.dimension.state == 1) {
                    this.offset = ((float) this.dimensionMultiplier) * this.dimension.value;
                } else {
                    return;
                }
            }
            if (this.oppositeDimension != null) {
                if (this.oppositeDimension.state == 1) {
                    this.oppositeOffset = ((float) this.oppositeDimensionMultiplier) * this.oppositeDimension.value;
                } else {
                    return;
                }
            }
            if (this.type == 1 && (this.target == null || this.target.state == 1)) {
                if (this.target == null) {
                    this.resolvedTarget = this;
                    this.resolvedOffset = this.offset;
                } else {
                    this.resolvedTarget = this.target.resolvedTarget;
                    this.resolvedOffset = this.target.resolvedOffset + this.offset;
                }
                didResolve();
            } else if (this.type == 2 && this.target != null && this.target.state == 1 && this.opposite != null && this.opposite.target != null && this.opposite.target.state == 1) {
                if (LinearSystem.getMetrics() != null) {
                    Metrics metrics = LinearSystem.getMetrics();
                    metrics.centerConnectionResolved++;
                }
                this.resolvedTarget = this.target.resolvedTarget;
                this.opposite.resolvedTarget = this.opposite.target.resolvedTarget;
                int i = 0;
                if (!(this.myAnchor.mType == Type.RIGHT || this.myAnchor.mType == Type.BOTTOM)) {
                    z = false;
                }
                float f3 = z ? this.target.resolvedOffset - this.opposite.target.resolvedOffset : this.opposite.target.resolvedOffset - this.target.resolvedOffset;
                if (this.myAnchor.mType == Type.LEFT || this.myAnchor.mType == Type.RIGHT) {
                    f2 = f3 - ((float) this.myAnchor.mOwner.getWidth());
                    f = this.myAnchor.mOwner.mHorizontalBiasPercent;
                } else {
                    f2 = f3 - ((float) this.myAnchor.mOwner.getHeight());
                    f = this.myAnchor.mOwner.mVerticalBiasPercent;
                }
                int margin = this.myAnchor.getMargin();
                int margin2 = this.opposite.myAnchor.getMargin();
                if (this.myAnchor.getTarget() == this.opposite.myAnchor.getTarget()) {
                    f = 0.5f;
                    margin2 = 0;
                } else {
                    i = margin;
                }
                float f4 = (float) i;
                float f5 = (float) margin2;
                float f6 = (f2 - f4) - f5;
                if (z) {
                    this.opposite.resolvedOffset = this.opposite.target.resolvedOffset + f5 + (f6 * f);
                    this.resolvedOffset = (this.target.resolvedOffset - f4) - (f6 * (1.0f - f));
                } else {
                    this.resolvedOffset = this.target.resolvedOffset + f4 + (f6 * f);
                    this.opposite.resolvedOffset = (this.opposite.target.resolvedOffset - f5) - (f6 * (1.0f - f));
                }
                didResolve();
                this.opposite.didResolve();
            } else if (this.type == 3 && this.target != null && this.target.state == 1 && this.opposite != null && this.opposite.target != null && this.opposite.target.state == 1) {
                if (LinearSystem.getMetrics() != null) {
                    Metrics metrics2 = LinearSystem.getMetrics();
                    metrics2.matchConnectionResolved++;
                }
                this.resolvedTarget = this.target.resolvedTarget;
                this.opposite.resolvedTarget = this.opposite.target.resolvedTarget;
                this.resolvedOffset = this.target.resolvedOffset + this.offset;
                this.opposite.resolvedOffset = this.opposite.target.resolvedOffset + this.opposite.offset;
                didResolve();
                this.opposite.didResolve();
            } else if (this.type == 5) {
                this.myAnchor.mOwner.resolve();
            }
        }
    }

    public void resolve(ResolutionAnchor resolutionAnchor, float f) {
        if (this.state == 0 || !(this.resolvedTarget == resolutionAnchor || this.resolvedOffset == f)) {
            this.resolvedTarget = resolutionAnchor;
            this.resolvedOffset = f;
            if (this.state == 1) {
                invalidate();
            }
            didResolve();
        }
    }

    /* access modifiers changed from: 0000 */
    public String sType(int i) {
        return i == 1 ? "DIRECT" : i == 2 ? "CENTER" : i == 3 ? "MATCH" : i == 4 ? "CHAIN" : i == 5 ? "BARRIER" : "UNCONNECTED";
    }

    public void setOpposite(ResolutionAnchor resolutionAnchor, float f) {
        this.opposite = resolutionAnchor;
        this.oppositeOffset = f;
    }

    public void setOpposite(ResolutionAnchor resolutionAnchor, int i, ResolutionDimension resolutionDimension) {
        this.opposite = resolutionAnchor;
        this.oppositeDimension = resolutionDimension;
        this.oppositeDimensionMultiplier = i;
    }

    public void setType(int i) {
        this.type = i;
    }

    public String toString() {
        if (this.state != 1) {
            StringBuilder sb = new StringBuilder();
            sb.append("{ ");
            sb.append(this.myAnchor);
            sb.append(" UNRESOLVED} type: ");
            sb.append(sType(this.type));
            return sb.toString();
        } else if (this.resolvedTarget == this) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("[");
            sb2.append(this.myAnchor);
            sb2.append(", RESOLVED: ");
            sb2.append(this.resolvedOffset);
            sb2.append("]  type: ");
            sb2.append(sType(this.type));
            return sb2.toString();
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("[");
            sb3.append(this.myAnchor);
            sb3.append(", RESOLVED: ");
            sb3.append(this.resolvedTarget);
            sb3.append(":");
            sb3.append(this.resolvedOffset);
            sb3.append("] type: ");
            sb3.append(sType(this.type));
            return sb3.toString();
        }
    }

    public void update() {
        ConstraintAnchor target2 = this.myAnchor.getTarget();
        if (target2 != null) {
            if (target2.getTarget() == this.myAnchor) {
                this.type = 4;
                target2.getResolutionNode().type = 4;
            }
            int margin = this.myAnchor.getMargin();
            if (this.myAnchor.mType == Type.RIGHT || this.myAnchor.mType == Type.BOTTOM) {
                margin = -margin;
            }
            dependsOn(target2.getResolutionNode(), margin);
        }
    }
}
