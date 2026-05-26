-- Supabase 数据库初始化 SQL
-- 在 Supabase SQL Editor 中执行此脚本

-- 1. 创建 gpus 表
CREATE TABLE IF NOT EXISTS gpus (
  id          INTEGER PRIMARY KEY,
  vendor      TEXT DEFAULT '',
  name        TEXT NOT NULL,
  arch        TEXT DEFAULT '',
  type        TEXT DEFAULT '',
  vram        TEXT DEFAULT '—',
  bandwidth   TEXT DEFAULT '—',
  interconnect TEXT DEFAULT '—',
  tdp         TEXT DEFAULT '—',
  fp16        TEXT DEFAULT '—',
  category    TEXT DEFAULT 'nvidia',
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 启用 RLS（Row Level Security）但允许公开读写
ALTER TABLE gpus ENABLE ROW LEVEL SECURITY;
CREATE POLICY "允许所有人读取" ON gpus FOR SELECT USING (true);
CREATE POLICY "允许所有人插入" ON gpus FOR INSERT WITH CHECK (true);
CREATE POLICY "允许所有人更新" ON gpus FOR UPDATE USING (true);
CREATE POLICY "允许所有人删除" ON gpus FOR DELETE USING (true);

-- 3. 插入默认数据
INSERT INTO gpus (id, vendor, name, arch, type, vram, bandwidth, interconnect, tdp, fp16, category) VALUES
(1, 'NVIDIA', 'H20', 'Hopper', 'SXM', '96G HBM3', '4TB/s', 'NVlink 900GB/s', '400W', 'INT8/FP8:296T\nFP16:148T\nTF32:59.8T', 'nvidia'),
(2, 'NVIDIA', 'H200', 'Hopper', 'SXM', '141G HBM3e', '4.8TB/s', 'Nvlink 900GB/s', '700W', 'FP8/INT8:1/2P*\nFP16:1/2P*\nTF32:495/989T*\nFP64:67T', 'nvidia'),
(3, 'NVIDIA', 'RTX 4090', 'Ada', 'PCIe', '24G GDDR6x (可选48G)', '1TB/s', '理论64GB/s', '450W', 'FP16:165T/330T*\nTF32:82.6/165.2T*', 'nvidia'),
(4, 'NVIDIA', 'RTX 4090D', 'Ada', 'PCIe', '24G GDDR6x', '1TB/s', '理论64GB/s', '425W', 'FP16:147/294T*\nTF32:73.54/147T*', 'nvidia'),
(5, 'NVIDIA', 'RTX 5090', 'Blackwell', 'PCIe 5.0', '32G GDDR7', '1.8TB/s', 'PCIe 128GB/s', '575W', 'FP16:210T/420T\nTF32:108T', 'nvidia'),
(6, 'NVIDIA', '5090D', 'Blackwell', 'PCIe 5.0', '32G GDDR7', '1.8TB/s', 'PCIe 128GB/s', '575W', 'FP16:150/297T*\nTF32:待确认', 'nvidia'),
(7, 'NVIDIA', 'H100 (SXM)', 'Hopper', 'SXM', '80G HBM3', '3.35TB/s', 'Nvlink 900GB/s', '700W', 'FP8/INT8:1/2P*\nFP16:1/2P*\nTF32:495/989T*\nFP64:67T', 'nvidia'),
(8, 'NVIDIA', 'H100 (PCIe)', 'Hopper', 'PCIe', '80G HBM3', '2TB/s', 'PCIe 128GB/s', '350W', 'FP16:0.8/1.6P*\nTF32:378/756T*\nFP64:51T', 'nvidia'),
(9, 'NVIDIA', 'H800 (SXM)', 'Hopper', 'SXM', '80G HBM3', '3.35TB/s', 'Nvlink 400GB/s', '700W', 'FP16:1/2P*\nTF32:495/989T*\nFP64:1T', 'nvidia'),
(10, 'NVIDIA', 'H800 (PCIe)', 'Hopper', 'PCIe', '80G HBM3', '2TB/s', 'PCIe 128GB/s', '350W', 'FP16:0.8/1.6P*\nTF32:378/756T*\nFP64:0.8T', 'nvidia'),
(11, 'NVIDIA', 'RTX PRO 6000', 'Blackwell', 'PCIe 5.0', '96G GDDR7', '1.6TB/s', 'PCIe 128GB/s', '600W', 'FP4:2/4P*\nFP8:1/2P*\nFP16:0.5/1P*', 'nvidia'),
(12, 'NVIDIA', 'A100 (SXM)', 'Ampere', 'SXM', '80G HBM2e', '2TB/s', 'PCIe 128GB/s', '400W', 'FP16:0.3/0.6P*\nTF32:156/312T*\nFP64:19.5T', 'nvidia'),
(13, 'NVIDIA', 'A100 (PCIe)', 'Ampere', 'PCIe', '80GB HBM2e', '2TB/s', 'PCIe 64GB/s', '300W', 'FP16:0.3/0.6P*\nTF32:156/312T*\nFP64:19.5T', 'nvidia'),
(14, 'NVIDIA', 'A800 (SXM)', 'Ampere', 'SXM', '80G HBM2e', '2TB/s', 'Nvlink 400GB/s', '400W', 'FP16:0.3/0.6P*\nTF32:156/312T*\nFP64:19.5T', 'nvidia'),
(15, 'NVIDIA', 'A800 (PCIe)', 'Ampere', 'PCIe', '80GB HBM2e', '2TB/s', 'PCIe 64GB/s', '300W', 'FP16:0.3/0.6P*\nTF32:156/312T*\nFP64:19.5T', 'nvidia'),
(16, 'NVIDIA', 'L40s', 'Ada', 'PCIe', '48G GDDR6x', '864GB/s', '64GB/s', '350W', 'FP16:366/733T*\nTF32:181/366T*', 'nvidia'),
(17, 'NVIDIA', 'L40', 'Ada', 'PCIe', '48G GDDR6x', '864GB/s', '64GB/s', '300W', 'FP16:181/362T*\nTF32:90.5/181T*', 'nvidia'),
(18, 'NVIDIA', 'L20', 'Ada', 'PCIe', '48G GDDR6x', '864GB/s', '64GB/s', '275W', 'FP16:119.5T\nTF32:59.8T', 'nvidia'),
(19, 'NVIDIA', 'L4', 'Ada', 'PCIe', '24G GDDR6x', '300GB/s', '理论64GB/s', '72W', 'FP16:121/242T*\nTF32:60.5/121T*', 'nvidia'),
(20, 'NVIDIA', 'L2', 'Ada', 'PCIe', '24G GDDR6x', '300GB/s', '64GB/s', '72W', 'FP16:96.5T\nTF32:48.3T', 'nvidia'),
(21, 'NVIDIA', 'GB200 NVL72', 'Blackwell', 'Rack', '—', '—', 'NVLink 5.0', '—', 'FP4:—\nFP8:—\nFP16:—', 'nvidia'),
(22, 'NVIDIA', 'HGX B200', 'Blackwell', 'SXM', '—', '—', 'NVLink 5.0', '—', '—', 'nvidia'),
(23, 'NVIDIA', 'HGX B100', 'Blackwell', 'SXM', '—', '—', 'NVLink 5.0', '—', '—', 'nvidia'),
(24, 'NVIDIA', 'H200 SXM', 'Hopper', 'SXM', '141G HBM3e', '4.8TB/s', 'NVLink 900GB/s', '700W', '—', 'nvidia'),
(25, 'NVIDIA', 'H100/H800 SXM', 'Hopper', 'SXM', '80G HBM3', '3.35TB/s', 'NVLink', '700W', '—', 'nvidia'),
(26, 'NVIDIA', 'A100/A800 SXM', 'Ampere', 'SXM', '80G HBM2e', '2TB/s', 'NVLink', '400W', '—', 'nvidia'),
(27, 'NVIDIA', 'RTX 5090 (SXM)', 'Blackwell', 'SXM', '32G GDDR7', '1.8TB/s', 'PCIe 128GB/s', '575W', '—', 'nvidia'),
(28, 'NVIDIA', 'RTX 4090 (SXM)', 'Ada', 'SXM', '24G GDDR6x', '1TB/s', 'PCIe', '450W', '—', 'nvidia'),
(29, 'NVIDIA', 'H20 SXM', 'Hopper', 'SXM', '96G HBM3', '4TB/s', 'NVLink 900GB/s', '400W', '—', 'nvidia'),
(30, '华为', '910B OAM', '昇腾', 'OAM', '—', '—', '—', '—', '—', 'china'),
(31, '华为', '昇腾910C', '昇腾', 'OAM', '—', '—', '—', '—', '—', 'china'),
(32, '华为', '昇腾950', '昇腾', '—', '—', '—', '—', '—', '—', 'china'),
(33, '天数智芯', '天垓150', '通用GPU', '—', '—', '—', '—', '—', '—', 'china'),
(34, '沐曦', '云C500 OAM', '通用GPU', 'OAM', '—', '—', '—', '—', '—', 'china'),
(35, '摩尔线程', 'S4000 OAM', 'MUSA', 'OAM', '—', '—', '—', '—', '—', 'china'),
(36, '摩尔线程', 'S5000', 'MUSA', '—', '—', '—', '—', '—', '—', 'china'),
(37, '海光', 'BW1000', '通用GPU', '—', '—', '—', '—', '—', '—', 'china'),
(38, '燧原', '云燧T21 OAM', '通用GPU', 'OAM', '—', '—', '—', '—', '—', 'china'),
(39, '寒武纪', 'MLU590', 'MLU', '—', '—', '—', '—', '—', '—', 'china')
ON CONFLICT (id) DO NOTHING;
