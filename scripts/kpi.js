// $.ajax({
//  url: '/statsv/chart/',
//  data: 'salt=1383449918&amp;db=cmdb&amp;target=biz.mt_www.entirepage_time&amp;to=1383321599&amp;from=1382112119&amp;anchor=charts-entirepage_time',
//  type: 'POST'
// }).done(function(data) { console.log(data); });
var data = {
	'主站完全加载TP50': [1026.12,1009.13,1019.99,1043.89,1070.95,1059.16,1069.56,1056.74,1049.71,1041.20,1036.94,1014.73,1020.18,1056.25],
	'主站完全加载TP90': [4115.08,3998.87,4155.29,4433.46,4795.88,4960.54,5395.46,5112.77,4993.52,5164.06,4899.43,4444.29,4442.21,4585.11],
	'主站首屏加载TP50': [696.13,691.44,692.56,686.34,694.78,680.17,675.68,672.84,677.09,671.04,661.54,650.50,653.38,672.97],
	'主站首屏加载TP90': [2627.24,2552.55,2624.17,2726.02,2898.46,2951.13,3119.20,3024.56,2984.85,3003.40,2935.15,2729.76,2751.59,2875.86],
	'商家完全加载TP50': [805.80,794.81,784.64,787.29,799.88,802.35,823.42,807.43,794.99,779.62,787.25,788.94,775.30,780.84],
	'商家完全加载TP90': [2447.67,2363.69,2263.80,2328.92,2481.05,2460.74,2565.25,2483.81,2448.92,2292.14,2348.93,2366.31,2259.47,2356.13]
};

for (var name in data) {
	var ret = compute(data[name]);
	console.log('%s\t%d\t%d%%', name, ret[0], ret[1]);
}

function compute(o) {
	var ret = [],
		front = 0,
		behind = 0,
		i;
	for (i = 0; i < 7; i++) {
		front += o[i];
	}
	for (i = 7; i < 14; i++) {
		behind += o[i];
	}
	front = front / 7;
	behind = behind / 7;
	ret[0] = behind.toFixed(2);
	ret[1] = (100 * (front - behind) / front).toFixed(2);

	return ret;
}
