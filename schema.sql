CREATE TABLE IF NOT EXISTS events (id TEXT PRIMARY KEY,type TEXT NOT NULL,payload TEXT NOT NULL,created_at TEXT NOT NULL DEFAULT (datetime('now')));
CREATE TABLE IF NOT EXISTS enterprise_records (id TEXT PRIMARY KEY,tenant_id TEXT NOT NULL,title TEXT NOT NULL,payload TEXT NOT NULL,created_at TEXT NOT NULL DEFAULT (datetime('now')));
CREATE TABLE IF NOT EXISTS subscriptions (id TEXT PRIMARY KEY,account_id TEXT NOT NULL,plan TEXT,status TEXT,expires_at TEXT,created_at TEXT NOT NULL DEFAULT (datetime('now')));
CREATE TABLE IF NOT EXISTS video_jobs (id TEXT PRIMARY KEY,status TEXT NOT NULL,model TEXT,payload TEXT NOT NULL,created_at TEXT NOT NULL,updated_at TEXT NOT NULL);
CREATE INDEX IF NOT EXISTS idx_sub_account ON subscriptions(account_id);
CREATE INDEX IF NOT EXISTS idx_records_tenant ON enterprise_records(tenant_id);
