:root {
    --ems-primary: #2563eb;
    --ems-primary-dark: #1d4ed8;
    --ems-secondary: #64748b;
    --ems-success: #10b981;
    --ems-danger: #ef4444;
    --ems-warning: #f59e0b;
    --ems-info: #06b6d4;
    --ems-dark: #1e293b;
    --ems-light: #f8fafc;
    --ems-sidebar: #0f172a;
    --ems-sidebar-hover: #1e293b;
    --ems-card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    --ems-transition: all 0.3s ease;
}

/* ==========================================
   GLOBAL STYLES
   ========================================== */
Body {
    Font-family:‘Segoe UI’, system-ui, -apple-system, sans-serif;
    Background-color: #f1f5f9;
    Color: #334155;
    Overflow-x: hidden;
}

A {
    Text-decoration: none;
    Color: inherit;
    Transition: var(--ems-transition);
}

/* ==========================================
   WELCOME PAGE (Page 1)
   ========================================== */
.welcome-page {
    Min-height: 100vh;
    Background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    Display: flex;
    Align-items: center;
    Justify-content: center;
    Position: relative;
    Overflow: hidden;
}

.welcome-page::before {
    Content: ‘’;
    Position: absolute;
    Width: 200%;
    Height: 200%;
    Background: url(“data:image/svg+xml,%3Csvg width=’60’ height=’60’ viewBox=’0 0 60 60’ xmlns=’http://www.w3.org/2000/svg’%3E%3Cg fill=’none’ fill-rule=’evenodd’%3E%3Cg fill=’%23ffffff’ fill-opacity=’0.05’%3E%3Cpath d=’M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z’/%3E%3C/g%3E%3C/g%3E%3C/svg%3E”);
    Animation: float 20s linear infinite;
}

@keyframes float {
    0% { transform: translate(0, 0); }
    100% { transform: translate(-50%, -50%); }
}

.welcome-content {
    Position: relative;
    z-index: 1;
    text-align: center;
    color: white;
    padding: 2rem;
}

.ems-logo-large {
    Width: 120px;
    Height: 120px;
    Background: white;
    Border-radius: 24px;
    Display: flex;
    Align-items: center;
    Justify-content: center;
    Margin: 0 auto 2rem;
    Box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    Animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); }
}

.ems-logo-large I {
    Font-size: 3.5rem;
    Color: var(--ems-primary);
}

.welcome-title {
    Font-size: 2.5rem;
    Font-weight: 700;
    Margin-bottom: 0.5rem;
    Text-shadow: 0 2px 10px rgba(0,0,0,0.2);
}

.welcome-subtitle {
    Font-size: 1.1rem;
    Opacity: 0.9;
    Margin-bottom: 2.5rem;
    Font-weight: 300;
}

.btn-welcome {
    Background: white;
    Color: var(--ems-primary);
    Padding: 1rem 3rem;
    Border-radius: 50px;
    Font-weight: 600;
    Font-size: 1.1rem;
    Border: none;
    Box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    Transition: var(--ems-transition);
    Display: inline-flex;
    Align-items: center;
    Gap: 0.5rem;
}

.btn-welcome:hover {
    Transform: translateY(-3px);
    Box-shadow: 0 15px 40px rgba(0,0,0,0.3);
    Color: var(--ems-primary-dark);
}

/* ==========================================
   AUTH PAGES (Login, Register, Forgot)
   ========================================== */
.auth-page {
    Min-height: 100vh;
    Background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    Display: flex;
    Align-items: center;
    Justify-content: center;
    Padding: 2rem;
}

.auth-card {
    Background: white;
    Border-radius: 20px;
    Box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
    Overflow: hidden;
    Width: 100%;
    Max-width: 480px;
}

.auth-header {
    Background: linear-gradient(135deg, var(--ems-primary) 0%, #4f46e5 100%);
    Padding: 2.5rem 2rem;
    Text-align: center;
    Color: white;
}

.auth-header I {
    Font-size: 3rem;
    Margin-bottom: 1rem;
    Display: block;
}

.auth-header h2 {
    Font-weight: 700;
    Margin-bottom: 0.25rem;
}

.auth-header p {
    Opacity: 0.85;
    Margin: 0;
    Font-size: 0.95rem;
}

.auth-body {
    Padding: 2rem;
}

.auth-input-group {
    Position: relative;
    Margin-bottom: 1.25rem;
}

.auth-input-group I {
    Position: absolute;
    Left: 1rem;
    Top: 50%;
    Transform: translateY(-50%);
    Color: var(--ems-secondary);
    Font-size: 1.1rem;
}

.auth-input {
    Width: 100%;
    Padding: 0.875rem 1rem 0.875rem 3rem;
    Border: 2px solid #e2e8f0;
    Border-radius: 12px;
    Font-size: 0.95rem;
    Transition: var(--ems-transition);
    Background: #f8fafc;
}

.auth-input:focus {
    Border-color: var(--ems-primary);
    Background: white;
    Box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
    Outline: none;
}

.btn-auth {
    Width: 100%;
    Padding: 0.875rem;
    Background: linear-gradient(135deg, var(--ems-primary) 0%, #4f46e5 100%);
    Color: white;
    Border: none;
    Border-radius: 12px;
    Font-weight: 600;
    Font-size: 1rem;
    Transition: var(--ems-transition);
    Margin-top: 0.5rem;
}

.btn-auth:hover {
    Transform: translateY(-2px);
    Box-shadow: 0 10px 20px rgba(37, 99, 235, 0.3);
}

.auth-footer {
    Text-align: center;
    Padding: 1.5rem 2rem;
    Background: #f8fafc;
    Border-top:1px solid #e2e8f0;
}

.auth-footer a {
    Color: var(--ems-primary);
    Font-weight: 600;
}

.auth-footer a:hover {
    Text-decoration: underline;
}

/* Account Type Selection */
.account-type-card {
    Border: 2px solid #e2e8f0;
    Border-radius: 16px;
    Padding: 1.5rem;
    Text-align: center;
    Cursor: pointer;
    Transition: var(--ems-transition);
    Background: white;
}

.account-type-card:hover {
    Border-color: var(--ems-primary);
    Transform: translateY(-3px);
    Box-shadow: var(--ems-card-shadow);
}

.account-type-card.selected {
    Border-color: var(--ems-primary);
    Background: rgba(37, 99, 235, 0.05);
    Box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
}

.account-type-card I {
    Font-size: 2.5rem;
    Color: var(--ems-primary);
    Margin-bottom: 0.75rem;
    Display: block;
}

.account-type-card h5 {
    Font-weight: 600;
    Margin-bottom: 0.25rem;
    Color: var(--ems-dark);
}

.account-type-card p {
    Font-size: 0.85rem;
    Color: var(--ems-secondary);
    Margin: 0;
}

/* Step Indicator */
.step-indicator {
    Display: flex;
    Justify-content: center;
    Gap: 1rem;
    Margin-bottom: 2rem;
}

.step-dot {
    Width: 40px;
    Height: 40px;
    Border-radius: 50%;
    Background: #e2e8f0;
    Display: flex;
    Align-items: center;
    Justify-content: center;
    Font-weight: 600;
    Color: var(--ems-secondary);
    Transition: var(--ems-transition);
    Position: relative;
}

.step-dot.active {
    Background: var(--ems-primary);
    Color: white;
}

.step-dot.completed {
    Background: var(--ems-success);
    Color: white;
}

.step-dot::after {
    Content: ‘’;
    Position: absolute;
    Right: -1rem;
    Top: 50%;
    Transform: translateY(-50%);
    Width: 1rem;
    Height: 2px;
    Background: #e2e8f0;
}

.step-dot:last-child::after {
    Display: none;
}

/* ==========================================
   PUBLIC FEED PAGE (Page 2)
   ========================================== */
.feed-header {
    Background: white;
    Box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    Padding: 1rem 0;
    Position: sticky;
    Top: 0;
    z-index: 1000;
}

.feed-logo {
    Font-size: 1.5rem;
    Font-weight: 700;
    Color: var(--ems-primary);
    Display: flex;
    Align-items: center;
    Gap: 0.5rem;
}

.feed-search {
    Position: relative;
    Max-width: 500px;
}

.feed-search I {
    Position: absolute;
    Left: 1rem;
    Top: 50%;
    Transform: translateY(-50%);
    Color: var(--ems-secondary);
}

.feed-search input {
    Width: 100%;
    Padding: 0.75rem 1rem 0.75rem 2.75rem;
    Border: 2px solid #e2e8f0;
    Border-radius: 50px;
    Font-size: 0.95rem;
    Transition: var(--ems-transition);
    Background: #f8fafc;
}

.feed-search input:focus {
    Border-color: var(--ems-primary);
    Background: white;
    Outline: none;
    Box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
}

.feed-nav-btn {
    Padding: 0.5rem 1.25rem;
    Border-radius: 50px;
    Font-weight: 500;
    Font-size: 0.9rem;
    Transition: var(--ems-transition);
}

.feed-nav-btn.login {
    Border: 2px solid var(--ems-primary);
    Color: var(--ems-primary);
    Background: transparent;
}

.feed-nav-btn.login:hover {
    Background: var(--ems-primary);
    Color: white;
}

.feed-nav-btn.register {
    Background: var(--ems-primary);
    Color: white;
    Border: 2px solid var(--ems-primary);
}

.feed-nav-btn.register:hover {
    Background: var(--ems-primary-dark);
    Border-color: var(--ems-primary-dark);
}

/* Feed Tabs */
.feed-tabs {
    Background: white;
    Border-bottom: 1px solid #e2e8f0;
    Padding: 0;
}

.feed-tab {
    Padding: 1rem 2rem;
    Border: none;
    Background: none;
    Font-weight: 600;
    Color: var(--ems-secondary);
    Border-bottom: 3px solid transparent;
    Transition: var(--ems-transition);
    Cursor: pointer;
    Display: flex;
    Align-items: center;
    Gap: 0.5rem;
}

.feed-tab.active {
    Color: var(--ems-primary);
    Border-bottom-color: var(--ems-primary);
}

.feed-tab:hover {
    Color: var(--ems-primary);
}

/* Job Card */
.job-card {
    Background: white;
    Border-radius: 16px;
    Box-shadow: var(--ems-card-shadow);
    Overflow: hidden;
    Transition: var(--ems-transition);
    Border: 1px solid #e2e8f0;
    Height: 100%;
}

.job-card:hover {
    Transform: translateY(-5px);
    Box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

.job-card-header {
    Padding: 1.25rem;
    Display: flex;
    Align-items: center;
    Gap: 1rem;
    Border-bottom: 1px solid #f1f5f9;
}

.company-logo {
    Width: 56px;
    Height: 56px;
    Border-radius: 12px;
    Object-fit: cover;
    Border: 2px solid #e2e8f0;
}

.company-info h5 {
    Font-weight: 700;
    Margin-bottom: 0.15rem;
    Color: var(--ems-dark);
    Display: flex;
    Align-items: center;
    Gap: 0.35rem;
}

.verified-badge {
    Color: var(--ems-success);
    Font-size: 0.9rem;
}

.company-info small {
    Color: var(--ems-secondary);
    Font-size: 0.8rem;
}

.job-card-body {
    Padding: 1.25rem;
}

.job-title {
    Font-weight: 700;
    Font-size: 1.1rem;
    Color: var(--ems-dark);
    Margin-bottom: 0.75rem;
}

.job-meta {
    Display: flex;
    Flex-wrap: wrap;
    Gap: 0.5rem;
    Margin-bottom: 1rem;
}

.job-meta-badge {
    Padding: 0.35rem 0.75rem;
    Border-radius: 50px;
    Font-size: 0.8rem;
    Font-weight: 500;
    Display: inline-flex;
    Align-items: center;
    Gap: 0.35rem;
}

.badge-category { background: #dbeafe; color: #1e40af; }
.badge-location { background: #fef3c7; color: #92400e; }
.badge-salary { background: #d1fae5; color: #065f46; }
.badge-type { background: #ede9fe; color: #5b21b6; }
.badge-deadline { background: #fee2e2; color: #991b1b; }

.job-description {
    Color: var(--ems-secondary);
    Font-size: 0.9rem;
    Line-height: 1.6;
    Margin-bottom: 1rem;
    Display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    Overflow: hidden;
}

.job-skills {
    Display: flex;
    Flex-wrap: wrap;
    Gap: 0.4rem;
    Margin-bottom: 1rem;
}

.skill-tag {
    Padding: 0.25rem 0.6rem;
    Background: #f1f5f9;
    Border-radius: 6px;
    Font-size: 0.75rem;
    Color: var(--ems-secondary);
    Font-weight: 500;
}

.job-card-footer {
    Padding: 1rem 1.25rem;
    Border-top: 1px solid #f1f5f9;
    Display: flex;
    Gap: 0.5rem;
}

.btn-job-action {
    Padding: 0.5rem 1rem;
    Border-radius: 10px;
    Font-size: 0.85rem;
    Font-weight: 500;
    Border: none;
    Transition: var(--ems-transition);
    Display: inline-flex;
    Align-items: center;
    Gap: 0.35rem;
    Cursor: pointer;
}

.btn-save { background: #fef2f2; color: #ef4444; }
.btn-save:hover { background: #ef4444; color: white; }

.btn-apply { background: #eff6ff; color: var(--ems-primary); }
.btn-apply:hover { background: var(--ems-primary); color: white; }

.btn-chat { background: #f0fdf4; color: var(--ems-success); }
.btn-chat:hover { background: var(--ems-success); color: white; }

.btn-details { background: #f8fafc; color: var(--ems-secondary); }
.btn-details:hover { background: var(--ems-secondary); color: white; }

/* Talent Card */
.talent-card {
    Background: white;
    Border-radius: 16px;
    Box-shadow: var(--ems-card-shadow);
    Overflow: hidden;
    Transition: var(--ems-transition);
    Border: 1px solid #e2e8f0;
    Height: 100%;
}

.talent-card:hover {
    Transform: translateY(-5px);
    Box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
}

.talent-card-header {
    Padding: 1.5rem;
    Text-align: center;
    Background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
    Position: relative;
}

.talent-photo {
    Width: 90px;
    Height: 90px;
    Border-radius: 50%;
    Object-fit: cover;
    Border: 4px solid white;
    Box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    Margin: 0 auto 0.75rem;
}

.talent-name {
    Font-weight: 700;
    Font-size: 1.1rem;
    Color: var(--ems-dark);
    Display: flex;
    Align-items: center;
    Justify-content: center;
    Gap: 0.35rem;
    Margin-bottom: 0.25rem;
}

.talent-profession {
    Color: var(--ems-primary);
    Font-weight: 600;
    Font-size: 0.9rem;
}

.talent-card-body {
    Padding: 1.25rem;
}

.talent-info-row {
    Display: flex;
    Align-items: center;
    Gap: 0.5rem;
    Margin-bottom: 0.5rem;
    Font-size: 0.85rem;
    Color: var(--ems-secondary);
}

.talent-info-row I {
    Color: var(--ems-primary);
    Width: 18px;
}

.talent-skills {
    Display: flex;
    Flex-wrap: wrap;
    Gap: 0.4rem;
    Margin: 1rem 0;
}

.talent-description {
    Color: var(--ems-secondary);
    Font-size: 0.85rem;
    Line-height: 1.5;
    Display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    Overflow: hidden;
}

.talent-card-footer {
    Padding: 1rem 1.25rem;
    Border-top: 1px solid #f1f5f9;
    Display: flex;
    Gap: 0.5rem;
}

/* ==========================================
   ADMIN SIDEBAR & LAYOUT
   ========================================== */
.admin-wrapper {
    Display: flex;
    Min-height: 100vh;
}

.admin-sidebar {
    Width: 260px;
    Background: var(--ems-sidebar);
    Color: #94a3b8;
    Position: fixed;
    Height: 100vh;
    Overflow-y: auto;
    z-index: 1000;
    transition: var(--ems-transition);
}

.sidebar-brand {
    Padding: 1.5rem;
    Border-bottom: 1px solid rgba(255,255,255,0.1);
    Display: flex;
    Align-items: center;
    Gap: 0.75rem;
    Color: white;
    Font-weight: 700;
    Font-size: 1.1rem;
}

.sidebar-brand I {
    Font-size: 1.5rem;
    Color: var(--ems-primary);
}

.sidebar-user {
    Padding: 1.25rem 1.5rem;
    Border-bottom: 1px solid rgba(255,255,255,0.05);
    Display: flex;
    Align-items: center;
    Gap: 0.75rem;
}

.sidebar-user img {
    Width: 44px;
    Height: 44px;
    Border-radius: 50%;
    Object-fit: cover;
    Border: 2px solid rgba(255,255,255,0.2);
}

.sidebar-user-info h6 {
    Color: white;
    Font-weight: 600;
    Margin-bottom: 0.1rem;
    Font-size: 0.9rem;
}

.sidebar-user-info small {
    Font-size: 0.75rem;
    Color: #64748b;
}

.sidebar-menu {
    Padding: 1rem 0;
}

.sidebar-menu-title {
    Padding: 0.5rem 1.5rem;
    Font-size: 0.7rem;
    Text-transform: uppercase;
    Letter-spacing: 1px;
    Color: #64748b;
    Font-weight: 600;
    Margin-top: 0.5rem;
}

.sidebar-item {
    Padding: 0.75rem 1.5rem;
    Display: flex;
    Align-items: center;
    Gap: 0.75rem;
    Cursor: pointer;
    Transition: var(--ems-transition);
    Border-left: 3px solid transparent;
    Font-size: 0.9rem;
}

.sidebar-item:hover {
    Background: var(--ems-sidebar-hover);
    Color: white;
}

.sidebar-item.active {
    Background: var(--ems-sidebar-hover);
    Color: white;
    Border-left-color: var(--ems-primary);
}

.sidebar-item I {
    Font-size: 1.1rem;
    Width: 24px;
    Text-align: center;
}

.sidebar-item.logout {
    Color: var(--ems-danger);
    Margin-top: 1rem;
    Border-top: 1px solid rgba(255,255,255,0.05);
    Padding-top: 1rem;
}

.sidebar-item.logout:hover {
    Background: rgba(239, 68, 68, 0.1);
}

.admin-main {
    Flex: 1;
    Margin-left: 260px;
    Min-height: 100vh;
    Background: #f1f5f9;
}

.admin-header {
    Background: white;
    Padding: 1rem 2rem;
    Display: flex;
    Align-items: center;
    Justify-content: space-between;
    Box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    Position: sticky;
    Top: 0;
    z-index: 100;
}

.admin-header h4 {
    Font-weight: 700;
    Color: var(--ems-dark);
    Margin: 0;
}

.header-actions {
    Display: flex;
    Align-items: center;
    Gap: 1rem;
}

.header-btn {
    Width: 40px;
    Height: 40px;
    Border-radius: 10px;
    Border: 1px solid #e2e8f0;
    Background: white;
    Color: var(--ems-secondary);
    Display: flex;
    Align-items: center;
    Justify-content: center;
    Cursor: pointer;
    Transition: var(--ems-transition);
    Position: relative;
}

.header-btn:hover {
    Background: #f8fafc;
    Color: var(--ems-primary);
}

.header-btn .badge {
    Position: absolute;
    Top: -5px;
    Right: -5px;
    Font-size: 0.65rem;
    Padding: 0.2rem 0.4rem;
}

.admin-content {
    Padding: 2rem;
}

/* ==========================================
   DASHBOARD CARDS
   ========================================== */
.dashboard-card {
    Background: white;
    Border-radius: 16px;
    Padding: 1.5rem;
    Box-shadow: var(--ems-card-shadow);
    Transition: var(--ems-transition);
    Border: 1px solid #e2e8f0;
    Height: 100%;
}

.dashboard-card:hover {
    Transform: translateY(-3px);
    Box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
}

.dashboard-card-icon {
    Width: 56px;
    Height: 56px;
    Border-radius: 14px;
    Display: flex;
    Align-items: center;
    Justify-content: center;
    Font-size: 1.5rem;
    Margin-bottom: 1rem;
}

.icon-blue { background: #dbeafe; color: #2563eb; }
.icon-green { background: #d1fae5; color: #10b981; }
.icon-orange { background: #ffedd5; color: #f97316; }
.icon-purple { background: #ede9fe; color: #8b5cf6; }
.icon-red { background: #fee2e2; color: #ef4444; }
.icon-cyan { background: #cffafe; color: #06b6d4; }

.dashboard-card h3 {
    Font-size: 1.75rem;
    Font-weight: 700;
    Color: var(--ems-dark);
    Margin-bottom: 0.25rem;
}

.dashboard-card p {
    Color: var(--ems-secondary);
    Font-size: 0.9rem;
    Margin: 0;
}

.dashboard-card .trend {
    Display: inline-flex;
    Align-items: center;
    Gap: 0.25rem;
    Font-size: 0.8rem;
    Font-weight: 600;
    Margin-top: 0.5rem;
}

.trend-up { color: var(--ems-success); }
.trend-down { color: var(--ems-danger); }

/* ==========================================
   DATA TABLES
   ========================================== */
.ems-table-card {
    Background: white;
    Border-radius: 16px;
    Box-shadow: var(--ems-card-shadow);
    Overflow: hidden;
    Border: 1px solid #e2e8f0;
}

.table-header {
    Padding: 1.25rem 1.5rem;
    Display: flex;
    Align-items: center;
    Justify-content: space-between;
    Border-bottom: 1px solid #f1f5f9;
}

.table-header h5 {
    Font-weight: 700;
    Color: var(--ems-dark);
    Margin: 0;
}

.ems-table {
    Width: 100%;
    Margin: 0;
}

.ems-table thead th {
    Background: #f8fafc;
    Color: var(--ems-secondary);
    Font-weight: 600;
    Font-size: 0.8rem;
    Text-transform: uppercase;
    Letter-spacing: 0.5px;
    Padding: 1rem 1.25rem;
    Border: none;
    White-space: nowrap;
}

.ems-table tbody td {
    Padding: 1rem 1.25rem;
    Vertical-align: middle;
    Border-bottom: 1px solid #f1f5f9;
    Font-size: 0.9rem;
    Color: #475569;
}

.ems-table

