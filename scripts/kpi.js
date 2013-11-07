// $.ajax({
//  url: '/statsv/chart/',
//  data: 'salt=1383449918&amp;db=cmdb&amp;target=biz.mt_www.entirepage_time&amp;to=1383321599&amp;from=1382112119&amp;anchor=charts-entirepage_time',
//  type: 'POST'
// }).done(function(data) { console.log(data); });
var data = {
	'主站完全加载TP50': [1032.01,1022.10,1016.73,1013.13,1006.26,1020.63,1060.79,1026.12,1009.13,1019.99,1043.89,1070.95,1059.16,1069.56],
	'主站完全加载TP90': [4043.60,3944.49,4019.41,4115.45,4051.63,4122.63,4285.75,4115.08,3998.87,4155.29,4433.46,4795.88,4960.54,5395.46],
	'主站首屏加载TP50': [703.16,698.34,698.37,691.73,691.40,698.79,726.81,696.13,691.44,692.56,686.34,694.78,680.17,675.68],
	'主站首屏加载TP90': [2591.14,2532.62,2599.71,2625.76,2599.10,2671.50,2769.53,2627.24,2552.55,2624.17,2726.02,2898.46,2951.13,3119.20],
	'商家完全加载TP50': [801.88,797.36,788.11,788.42,781.83,778.17,808.13,805.80,794.81,784.64,787.29,799.88,802.35,823.42],
	'商家完全加载TP90': [2451.77,2400.21,2292.34,2361.12,2281.84,2248.40,2407.67,2447.67,2363.69,2263.80,2328.92,2481.05,2460.74,2565.25]
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