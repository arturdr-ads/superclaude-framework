# E-commerce Business Panel - Component Library Specification

## Component Architecture Overview

This document specifies the complete component library for the e-commerce platform expansion business panel, following atomic design principles and accessibility-first development.

## 1. Foundation Components (Atoms)

### 1.1 Typography Components

#### Text Component
```typescript
interface TextProps {
  variant: 'h1' | 'h2' | 'h3' | 'h4' | 'body-lg' | 'body' | 'body-sm' | 'body-xs';
  color?: 'primary' | 'secondary' | 'muted' | 'success' | 'warning' | 'error';
  weight?: 'normal' | 'medium' | 'semibold' | 'bold';
  align?: 'left' | 'center' | 'right';
  children: React.ReactNode;
  className?: string;
}
```

**Accessibility Features:**
- Semantic HTML elements (h1-h6, p, span)
- Proper heading hierarchy
- Screen reader announcements

### 1.2 Button Components

#### Base Button
```typescript
interface ButtonProps {
  variant: 'primary' | 'secondary' | 'outline' | 'ghost' | 'danger';
  size: 'sm' | 'md' | 'lg';
  children: React.ReactNode;
  disabled?: boolean;
  loading?: boolean;
  icon?: React.ReactNode;
  iconPosition?: 'left' | 'right';
  onClick?: () => void;
  type?: 'button' | 'submit' | 'reset';
}
```

**Design Specifications:**
- **Primary**: #2563EB background, white text
- **Secondary**: #F1F5F9 background, #1E293B text
- **Outline**: Transparent background, #2563EB border
- **Ghost**: Transparent background, #2563EB text
- **Danger**: #DC2626 background, white text

**Sizes:**
- **sm**: height 32px, padding 8px 12px
- **md**: height 40px, padding 12px 16px
- **lg**: height 48px, padding 16px 20px

### 1.3 Input Components

#### Text Input
```typescript
interface InputProps {
  label: string;
  type?: 'text' | 'email' | 'password' | 'number' | 'tel' | 'url';
  placeholder?: string;
  value: string;
  onChange: (value: string) => void;
  error?: string;
  helperText?: string;
  required?: boolean;
  disabled?: boolean;
  icon?: React.ReactNode;
}
```

**Accessibility Features:**
- Proper label association
- Error message announcement
- Keyboard navigation
- ARIA attributes for validation states

### 1.4 Icon Components

#### Icon System
```typescript
interface IconProps {
  name: string; // from design system
  size?: 16 | 20 | 24 | 32;
  color?: string;
  className?: string;
}
```

**Icon Categories:**
- **Navigation**: menu, home, settings, user
- **Actions**: add, edit, delete, download, upload
- **Status**: success, warning, error, info
- **Data**: chart, table, filter, sort

## 2. Composite Components (Molecules)

### 2.1 Form Components

#### Form Field
```typescript
interface FormFieldProps {
  label: string;
  required?: boolean;
  error?: string;
  helperText?: string;
  children: React.ReactNode;
}
```

**Features:**
- Automatic label association
- Error state styling
- Helper text positioning
- Required field indication

#### Date Range Picker
```typescript
interface DateRangePickerProps {
  value: { start: Date; end: Date };
  onChange: (range: { start: Date; end: Date }) => void;
  presets?: Array<{ label: string; value: string }>;
  maxRange?: number; // days
}
```

**Preset Options:**
- Last 7 days
- Last 30 days
- Last 90 days
- This month
- Last month
- Custom range

### 2.2 Data Display Components

#### Badge Component
```typescript
interface BadgeProps {
  variant: 'default' | 'success' | 'warning' | 'error' | 'info';
  size?: 'sm' | 'md' | 'lg';
  children: React.ReactNode;
}
```

**Use Cases:**
- Status indicators
- Category tags
- Count badges
- Priority labels

#### Progress Indicator
```typescript
interface ProgressProps {
  value: number; // 0-100
  max?: number;
  label?: string;
  showValue?: boolean;
  variant?: 'default' | 'success' | 'warning' | 'error';
}
```

## 3. Layout Components (Organisms)

### 3.1 Card Components

#### Base Card
```typescript
interface CardProps {
  title?: string;
  subtitle?: string;
  children: React.ReactNode;
  actions?: React.ReactNode;
  footer?: React.ReactNode;
  loading?: boolean;
  error?: string;
}
```

**Layout Structure:**
```
┌─────────────────────────┐
│ Title        [Actions]  │
│ Subtitle                │
├─────────────────────────┤
│                         │
│       Content           │
│                         │
├─────────────────────────┤
│         Footer          │
└─────────────────────────┘
```

#### KPI Card (Specialized)
```typescript
interface KPICardProps {
  title: string;
  value: string | number;
  change?: number;
  trend?: 'up' | 'down' | 'neutral';
  format?: 'currency' | 'percentage' | 'number' | 'custom';
  icon?: React.ReactNode;
  loading?: boolean;
  onClick?: () => void;
}
```

**Visual Design:**
- **Background**: White with subtle shadow
- **Border**: 1px solid #E2E8F0
- **Border Radius**: 8px
- **Padding**: 20px
- **Hover**: Elevation increase

### 3.2 Navigation Components

#### Sidebar Navigation
```typescript
interface SidebarProps {
  isOpen: boolean;
  onClose: () => void;
  currentPath: string;
  navigationItems: Array<{
    label: string;
    href: string;
    icon: React.ReactNode;
    badge?: number | string;
  }>;
}
```

**Responsive Behavior:**
- **Desktop**: Always visible (240px)
- **Tablet**: Collapsible (64px → 240px)
- **Mobile**: Overlay modal

#### Breadcrumb Navigation
```typescript
interface BreadcrumbProps {
  items: Array<{
    label: string;
    href?: string;
  }>;
  separator?: React.ReactNode;
}
```

### 3.3 Data Table Components

#### Table Component
```typescript
interface TableProps<T> {
  columns: Array<{
    key: string;
    title: string;
    render?: (value: any, row: T) => React.ReactNode;
    sortable?: boolean;
    width?: number | string;
  }>;
  data: T[];
  loading?: boolean;
  emptyState?: React.ReactNode;
  pagination?: {
    current: number;
    total: number;
    pageSize: number;
    onChange: (page: number) => void;
  };
  onSort?: (key: string, direction: 'asc' | 'desc') => void;
}
```

**Features:**
- Column sorting
- Pagination
- Loading states
- Empty states
- Responsive behavior

## 4. Business Intelligence Components

### 4.1 Chart Components

#### Line Chart
```typescript
interface LineChartProps {
  data: Array<{ date: string; value: number; category?: string }>;
  title?: string;
  height?: number;
  colors?: string[];
  showLegend?: boolean;
  showTooltip?: boolean;
  loading?: boolean;
}
```

**Accessibility Features:**
- High contrast color palette
- Data table alternative
- Keyboard navigation
- Screen reader descriptions

#### Bar Chart
```typescript
interface BarChartProps {
  data: Array<{ category: string; value: number; color?: string }>;
  orientation?: 'vertical' | 'horizontal';
  showValues?: boolean;
  stacked?: boolean;
}
```

### 4.2 Metric Components

#### Trend Indicator
```typescript
interface TrendIndicatorProps {
  value: number; // percentage change
  showIcon?: boolean;
  showValue?: boolean;
  format?: 'percentage' | 'absolute';
}
```

**Visual States:**
- **Positive**: Green color, upward arrow
- **Negative**: Red color, downward arrow
- **Neutral**: Gray color, dash

#### Comparison Metric
```typescript
interface ComparisonMetricProps {
  current: number;
  previous: number;
  label: string;
  format?: 'currency' | 'percentage' | 'number';
}
```

## 5. Interactive Components

### 5.1 Filter Components

#### Multi-Select Filter
```typescript
interface MultiSelectFilterProps {
  options: Array<{ label: string; value: string }>;
  selected: string[];
  onChange: (selected: string[]) => void;
  placeholder?: string;
  searchable?: boolean;
}
```

#### Date Filter
```typescript
interface DateFilterProps {
  value: { start?: Date; end?: Date };
  onChange: (range: { start?: Date; end?: Date }) => void;
  presets?: Array<{ label: string; value: string }>;
}
```

### 5.2 Action Components

#### Action Menu
```typescript
interface ActionMenuProps {
  trigger: React.ReactNode;
  items: Array<{
    label: string;
    onClick: () => void;
    icon?: React.ReactNode;
    disabled?: boolean;
    danger?: boolean;
  }>;
  placement?: 'bottom-start' | 'bottom-end' | 'top-start' | 'top-end';
}
```

#### Bulk Actions
```typescript
interface BulkActionsProps {
  selectedCount: number;
  actions: Array<{
    label: string;
    onClick: () => void;
    icon?: React.ReactNode;
  }>;
  onClearSelection: () => void;
}
```

## 6. Feedback Components

### 6.1 Notification Components

#### Toast Notification
```typescript
interface ToastProps {
  id: string;
  title: string;
  description?: string;
  variant?: 'success' | 'error' | 'warning' | 'info';
  duration?: number;
  onClose?: () => void;
}
```

#### Alert Banner
```typescript
interface AlertProps {
  title: string;
  description?: string;
  variant: 'success' | 'error' | 'warning' | 'info';
  actions?: Array<{
    label: string;
    onClick: () => void;
  }>;
  dismissible?: boolean;
}
```

### 6.2 Loading Components

#### Skeleton Loader
```typescript
interface SkeletonProps {
  variant: 'text' | 'circular' | 'rectangular';
  width?: number | string;
  height?: number | string;
  animation?: 'pulse' | 'wave';
}
```

#### Progress Bar
```typescript
interface ProgressBarProps {
  value: number;
  max?: number;
  label?: string;
  showValue?: boolean;
  variant?: 'default' | 'success' | 'warning' | 'error';
}
```

## 7. Layout Components

### 7.1 Grid System

#### Responsive Grid
```typescript
interface GridProps {
  children: React.ReactNode;
  columns?: 1 | 2 | 3 | 4 | 6 | 12;
  gap?: 'sm' | 'md' | 'lg' | 'xl';
  responsive?: boolean;
}
```

#### Grid Item
```typescript
interface GridItemProps {
  children: React.ReactNode;
  span?: 1 | 2 | 3 | 4 | 6 | 12;
  sm?: number;
  md?: number;
  lg?: number;
  xl?: number;
}
```

### 7.2 Container Components

#### Page Container
```typescript
interface PageContainerProps {
  children: React.ReactNode;
  title?: string;
  subtitle?: string;
  actions?: React.ReactNode;
  breadcrumb?: Array<{ label: string; href?: string }>;
}
```

#### Section Container
```typescript
interface SectionProps {
  title?: string;
  subtitle?: string;
  children: React.ReactNode;
  actions?: React.ReactNode;
  collapsible?: boolean;
  defaultCollapsed?: boolean;
}
```

## 8. Accessibility Implementation

### 8.1 Focus Management

#### Focus Trap
```typescript
interface FocusTrapProps {
  children: React.ReactNode;
  active: boolean;
  onEscape?: () => void;
}
```

#### Skip Link
```typescript
interface SkipLinkProps {
  targetId: string;
  label?: string;
}
```

### 8.2 ARIA Patterns

#### Live Region
```typescript
interface LiveRegionProps {
  children: React.ReactNode;
  politeness?: 'polite' | 'assertive';
}
```

#### Visually Hidden
```typescript
interface VisuallyHiddenProps {
  children: React.ReactNode;
}
```

## 9. Component Testing Specifications

### 9.1 Unit Testing

#### Test Coverage Requirements
- **Accessibility**: 100% coverage for ARIA attributes
- **User Interactions**: All click, keyboard, and touch events
- **Edge Cases**: Empty states, loading states, error states
- **Responsive Behavior**: All breakpoints and orientations

### 9.2 Integration Testing

#### Component Integration
- **Form Validation**: Error states and submission
- **Data Flow**: Props and state changes
- **Event Handling**: User interactions and callbacks
- **Performance**: Rendering efficiency and memory usage

## 10. Development Guidelines

### 10.1 Component Documentation

#### Storybook Stories
```typescript
// Example: Button.stories.tsx
export default {
  title: 'Components/Button',
  component: Button,
  parameters: {
    a11y: {
      config: {
        rules: [
          { id: 'color-contrast', enabled: true },
          { id: 'button-name', enabled: true }
        ]
      }
    }
  }
} as Meta;
```

### 10.2 Code Standards

#### TypeScript Configuration
```json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true
  }
}
```

#### ESLint Rules
```json
{
  "rules": {
    "jsx-a11y/anchor-is-valid": "error",
    "jsx-a11y/alt-text": "error",
    "jsx-a11y/label-has-associated-control": "error"
  }
}
```

---

This component library provides the foundation for building accessible, performant, and maintainable user interfaces for the e-commerce business panel. Each component follows established design patterns and accessibility standards to ensure consistent user experiences across the application.