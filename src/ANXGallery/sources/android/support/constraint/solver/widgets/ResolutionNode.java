package android.support.constraint.solver.widgets;

import java.util.HashSet;
import java.util.Iterator;

public class ResolutionNode {
    HashSet<ResolutionNode> dependents = new HashSet<>(2);
    int state = 0;

    public void addDependent(ResolutionNode resolutionNode) {
        this.dependents.add(resolutionNode);
    }

    public void didResolve() {
        this.state = 1;
        Iterator it = this.dependents.iterator();
        while (it.hasNext()) {
            ((ResolutionNode) it.next()).resolve();
        }
    }

    public void invalidate() {
        this.state = 0;
        Iterator it = this.dependents.iterator();
        while (it.hasNext()) {
            ((ResolutionNode) it.next()).invalidate();
        }
    }

    public boolean isResolved() {
        return this.state == 1;
    }

    public void reset() {
        this.state = 0;
        this.dependents.clear();
    }

    public void resolve() {
    }
}
