package com.etc.service;

import com.etc.dao.CinemaDaoImpl;
import com.etc.entity.Cinema;

import java.util.List;

public class CinemaServiceImpl implements CinemaService {
	CinemaDaoImpl dao = new CinemaDaoImpl();

	@Override
	public List<Cinema> queryCinemaName() {
		return dao.queryCinemaName();
	}
	/**
	 * 增加影厅
	 * @param cinema 影厅实体类
	 * @return	布尔型
	 */
	@Override
	public boolean insertCinema(Cinema cinema) {
		
		return dao.insertCinema(cinema);
	}
	/**
	 * 根据影厅编号修改影厅信息
	 * @param cinema 影厅实体类
	 * @return 布尔型
	 */
	@Override
	public boolean updateCinema(Cinema cinema) {
		return dao.updateCinema(cinema);
	}
	/**
	 * 修改影厅状态(是否空闲 1空闲 0正在播放)
	 * @param cinemaId 影厅状态
	 * @param cinemaId 影厅编号
	 * @return 布尔型
	 */
	@Override
	public boolean updateCinemaState(int cinemaState, int cinemaId) {
		
		return dao.updateCinemaState(cinemaState, cinemaId);
	}
	/**
	 * 查询所有影厅
	 * @return 所有的影厅
	 */
	@Override
	public List<Cinema> queryCinemas() {
		List<Cinema> list = dao.queryCinemas();
		return list;
	}

}
