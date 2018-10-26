var aysnc = require('async');
const superagent = require('superagent');
require('superagent-proxy')(superagent);
const cheerio = require('cheerio');
var sleep = require('sleep');

//代理服务器
const PROXY = 'http://61.135.217.7:80/'; 
//微博登陆用户cookies
const COOKIES = 'ALF=1543110073; _T_WM=8a2be432b23d1562b948934f06cb0273; SCF=Av7iadYXozGsZzLkRS65xmftcEVOq19tOPGQGaFVG3kw9MCaKhHHE-cpR6uwbEqsyLEC8VH0-6SNErtYhKES2dk.; SUB=_2A2521gGdDeRhGeRK61MZ-S7JzD2IHXVSOK_VrDV6PUJbktANLRTDkW1NU3smRocil_sN0lGDZtt2EXmkYTXKsnj8; SUBP=0033WrSXqPxfM725Ws9jqgMF55529P9D9W5CpnzXucJKzqrzYaSHy_Jy5JpX5K-hUgL.FozXeh2R1K5fS022dJLoIpqLxKBLBonLBo9yKr9yi--Xi-zRi-2R; SUHB=0M2ECTab-BLBP8; SSOLoginState=1540518349'; 
// 每次爬取间隔时间
const SLEEP_TIME = 500; 
//最大并发数
const LIMIT = 1; 
//用户id，即需要我们输入的数字，如昵称为“Dear-迪丽热巴”的id为1669879400
const uid = "1669879400"; 
//取值范围为0、1，程序默认值为0，代表要爬取用户的全部微博，1代表只爬取用户的原创微博
const filter = 0; 
var page = 1;
var pageTotal = 1;
const url = `https://weibo.cn/u/${uid}?filter=${filter}&page=${page}`;
var urls = [];

async function getFirst() {
	try {
		console.log(url);
	    const result = await superagent.get(url)
	    .proxy()
	    .set('Host', 'weibo.cn')
	    .set('Upgrade-Insecure-Requests', '1')
	    .set('Cookie', COOKIES)
	    .set('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36 DID:279560936:DID');
	    var $ = cheerio.load(result.text);
	    var total = Number($('.tc').text().replace('微博[', '').replace(']', ''));
		pageTotal = Math.ceil(total / 10);
		console.log('一共'+ total + '条微博', pageTotal + '页');
	    for(var i=1; i< 10; i++) {
			urls.push(`https://weibo.cn/u/${uid}?filter=${filter}&page=${i}`);
		}
		getWB();
	  } catch (error) {
	  	// if(error) throw error;
	    console.error(error.status);
	  }
}
async function fetchUrl(url) {
  try {
    const result = await superagent.get(url)
    .proxy()
    .set('Host', 'weibo.cn')
    .set('Upgrade-Insecure-Requests', '1')
    .set('Cookie', COOKIES)
    .set('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36 DID:279560936:DID')
    // console.log(result.text);
    // var $ = cheerio.load();
    console.log(new Date(), '正在爬取'+ url + '...');
    sleep.msleep(SLEEP_TIME);
  	return resolve(result.text);
  } catch (error) {
  	// if(error) throw error;
    console.error(error);
  }
}

function resolve(html) {
	var ResultArr = [];
    let $ = cheerio.load(html);
    let list = $('.c');
    let len = list.length;
    // const arr = [];
    let reg1 = /赞\[(.*)转发/g;
    let reg2 = /]转发\[(.*)评论/g;
    let reg3 = /]评论\[(.*)收藏/g;
    list.each(function(i, el) {
        let id = $(el).attr('id');
        if (id) {
            // console.log($(el).find('a').text())
            ResultArr.push({
            	content: $(el).html(),
                uid: uid,
                wbid: id,
                supportNum: str2num($(el).find('a').text().match(reg1)),
                forwardNum: str2num($(el).find('a').text().match(reg2)),
                commentNum: str2num($(el).find('a').text().match(reg3))
            })
        }
    });
    return ResultArr;
}
function str2num(arr) {
    if (arr) {
        return arr[0].replace(/[^0-9]/g, "")
    } else {
        return '';
    }
}
function getWB() {
	aysnc.mapLimit(urls, LIMIT, async function(url, cb) {
		return await fetchUrl(url);
	}, (err, rs) => {
		if(err) throw err;
		console.log('final');
		console.log(rs);
	});
}


async function start() {
	await getFirst();
}
start();