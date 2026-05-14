package data.travel_policy
# Consolidated approved policy rules for travel_policy
# Document ID: doc_d54524777db4
# All approved clauses included

package policy.ai.general.c1

import future.keywords.if
import future.keywords.in
import future.keywords.every

default allow := true

warn contains result if {
    input.restricteddestination == "Madurai"
    result := {
        "constraint": "allowance.general",
        "operator": "APPROVED",
        "value": "CONDITIONAL"
    }
}

deny contains msg if {
    input.restricteddestination == "Madurai"
    msg := "POLICY VIOLATION [C1]: Advisory — Action: EVALUATE. Destination 'Madurai' is restricted."
}

allow if {
    true
}

audit := {
    "policy"     : "policy.ai.general.c1",
    "clause_id"  : "C1",
    "intent"     : "ADVISORY",
    "severity"   : "MEDIUM",
    "enforcement": "WARN",
    "description": "Policy clause C1: ADVISORY",
    "timestamp"  : time.now_ns(),
}

# Default: Allow if no violations
allow_default {
    true
}
