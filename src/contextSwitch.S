.global _ZN7ThreadK13contextSwitchEPNS_7ContextES1_
.type _ZN7ThreadK13contextSwitchEPNS_7ContextES1_, @function
_ZN7ThreadK13contextSwitchEPNS_7ContextES1_:
    #a0 = &old->context
    #a1 = &new->context
    sd ra, 0 * 8(a0)
    sd sp, 1 * 8(a0)

     ld ra, 0 * 8(a1)
     ld sp, 1 * 8(a1)
     ret