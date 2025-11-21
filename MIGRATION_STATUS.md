# W3C CSS Migration Status

## Current Status: 75% Complete

### ✅ Completed
1. Created package structure with 43 modules organized by W3C spec
2. Migrated 630 source files from swift-css-types
3. Set up Package.swift with proper W3C CSS naming
4. Created module dependency graph
5. Replaced old imports (CSSTypes → W3C_CSS_*)
6. Created umbrella modules (Layout, Typography, Visual, Animation)
7. Added to Standards.xcworkspace

### ⚠️ Current Issue: Circular Dependency

**Problem:**
`W3C CSS Shared` has 117 files, many are property files that reference types from `W3C CSS Values` (Length, Angle, Time, etc.). However:
- `W3C CSS Values` depends on `W3C CSS Shared` (for base protocols)
- `W3C CSS Shared` CANNOT depend on `W3C CSS Values` (would create circular dependency)

**Files Remaining in Shared:**
```bash
/Users/coen/Developer/swift-standards/swift-w3c-css/Sources/W3C CSS Shared/
- 117 Swift files total
- 35+ files reference Length/Angle/Time/Percentage types
- These need to be moved OUT of Shared
```

### 🔧 Required Fix

**Architecture Decision:**
`W3C CSS Shared` should contain ONLY:
1. Base protocols (Property, AtRule, etc.)
2. Shared enums that don't depend on value types (Global, etc.)
3. Utility types
4. Documentation files (CSS.Properties.swift, CSS.Types.swift)

**Files to Move:**
All property files (files conforming to `Property` protocol) that reference value types must be moved to appropriate domain modules:

```
From: W3C CSS Shared
To:   Appropriate domain modules based on property category

Examples:
- MozImageRegion.swift → W3C CSS UI (vendor-specific)
- Vertical

Align.swift → W3C CSS Alignment
- Gap.swift, RowGap.swift → W3C CSS Flexbox or Grid
- BoxShadow.swift → W3C CSS Backgrounds
- All properties ending in Color → W3C CSS Color
- All properties ending in Opacity → W3C CSS Color
- etc.
```

### 📋 Next Steps

1. **Audit Shared Module:**
   ```bash
   cd "/Users/coen/Developer/swift-standards/swift-w3c-css/Sources/W3C CSS Shared"
   # List files that should stay (no Property conformance, no value type references)
   grep -L "Property\|Length\|Angle\|Time\|Percentage\|Number" *.swift
   ```

2. **Move Property Files:**
   - Systematically move each property file from Shared to its correct module
   - Follow W3C CSS specification organization
   - Vendor prefixes (-moz-, -webkit-) → W3C CSS UI or separate vendor module

3. **Fix Imports:**
   - Files now in domain modules can import both Shared AND Values
   - Remove any self-imports (modules importing themselves)

4. **Test Compilation:**
   ```bash
   swift build
   ```

5. **Fix Remaining Errors:**
   - Iteratively fix import issues revealed by compiler
   - Ensure all property files are in modules that can access their dependency types

### 📝 Module Dependency Graph

```
W3C CSS Shared (base protocols, no dependencies)
  └─ W3C CSS Values (Length, Angle, etc.)
       ├─ W3C CSS Color (Color types + color properties)
       ├─ W3C CSS Display (display property)
       ├─ W3C CSS Flexbox (flex properties) → imports Shared + Values
       ├─ W3C CSS Grid (grid properties) → imports Shared + Values
       ├─ W3C CSS BoxModel (sizing, spacing) → imports Shared + Values
       ├─ W3C CSS Text (text properties) → imports Shared + Values
       ├─ W3C CSS Fonts (font properties) → imports Shared + Values
       ├─ W3C CSS Backgrounds (background, border) → imports Shared + Values + Color
       ├─ W3C CSS Transforms → imports Shared + Values
       ├─ W3C CSS Animations → imports Shared + Values + Easing
       ├─ W3C CSS Transitions → imports Shared + Values + Easing
       ├─ W3C CSS UI (interface properties) → imports Shared + Values + Color
       └─ etc.
```

### 🎯 Estimated Remaining Work

- **Move Property Files:** 2-3 hours (117 files to categorize and move)
- **Fix Imports:** 1-2 hours (iterative compilation fixes)
- **Test Migration:** 1 hour
- **Total:** 4-6 hours

### 💡 Alternative Approach

If time-constrained, could:
1. Create a temporary `W3C CSS Properties` module
2. Move all 117 files from Shared to this module
3. Have Properties depend on Shared + Values
4. Later refactor Properties into proper domain modules

This would get compilation working faster, then allow iterative cleanup.
