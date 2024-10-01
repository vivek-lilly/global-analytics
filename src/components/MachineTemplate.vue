<template>
    <a-layout>
        <a-layout-header class="header template-heading">
            <div class="logo">Global Machine Inspection Dashboard</div>
            <div class="filter-box">
                    <a-input-search
                        placeholder="Search by client"
                        enter-button="Search"
                        @search="onSearch"
                        style="width: 300px; margin-right: 20px;"
                    />
                    <a-select
                        v-model="selectedFilter"
                        placeholder="Select a filter"
                        style="width: 200px;"
                        @change="onFilterChange"
                    >
                        <a-select-option value="all">All</a-select-option>
                        <a-select-option value="pass">Pass</a-select-option>
                        <a-select-option value="fail">Fail</a-select-option>
                    </a-select>
                </div>
        </a-layout-header>
        <a-layout-content>
            <div class="input-contract-container">
                <div class="template-type template-type-color">
                    <div class="template-box total-components">
                        <div class="template-title">Total Components</div>
                        <div class="template-value">100</div>
                    </div>
                    <div class="template-box pass">
                        <div class="template-title">Pass</div>
                        <div class="template-value">400</div>
                    </div>
                    <div class="template-box fail">
                        <div class="template-title">Fail</div>
                        <div class="template-value">700</div>
                    </div>
                    <div class="template-box frequent-defect">
                        <div class="template-title">Frequent Defect</div>
                        <div class="template-value">Scratches</div>
                    </div>
                    <div class="template-box time">
                        <div class="template-title">Time Taken</div>
                        <div class="template-value">10 mins</div>
                    </div>
                </div>
            </div>
            <div class="char-container">
                <div class="horizontal-line" />
                <div class="template-type">
                    <div class="template-box chart-box">
                        <div class="template-chart">
                            <PieChart :data="pieData" :options="pieOptions" />
                        </div>
                    </div>
                    <div class="template-box chart-box">
                        <div class="template-chart">
                            <LineChart :data="lineData" :options="lineOptions" />
                        </div>
                    </div>
                    <div class="template-box chart-box">
                        <div class="template-chart">
                            <BarChart :data="runTimeData" :options="runTimeOptions" />
                        </div>
                    </div>
                </div>
                <div class="horizontal-line" />
                <div class="template-type">
                    <div class="template-box chart-box">
                        <div class="template-chart">
                            <BarChart :data="barData" :options="barOptions" />
                        </div>
                    </div>
                    <div class="template-box chart-box">
                        <div class="template-chart">
                            <BarChart :data="componetDefectData" :options="componetDefectOptions" />
                        </div>
                    </div>
                </div>
            </div>
        </a-layout-content>
    </a-layout>
</template>

<script>
import { Pie, Line, Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, ArcElement, LineElement, BarElement, PointElement, CategoryScale, LinearScale } from 'chart.js';
import { Layout, Input, Select } from 'ant-design-vue';

ChartJS.register(Title, Tooltip, Legend, ArcElement, LineElement, BarElement, PointElement, CategoryScale, LinearScale);

export default {
    name: 'MachineTemplate',
    components: {
        PieChart: Pie,
        LineChart: Line,
        BarChart: Bar,
        'a-layout': Layout,
        'a-layout-header': Layout.Header,
        'a-layout-content': Layout.Content,
        'a-input-search': Input.Search,
        'a-select': Select,
        'a-select-option': Select.Option
    },
    data() {
        return {
            selectedFilter: 'all',
            pieData: {
                labels: ['Defect-1', 'Defect-2'],
                datasets: [
                    {
                        backgroundColor: ['#42b983', '#ff6384'],
                        data: [400, 700]
                    }
                ]
            },
            pieOptions: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Defect Distribution'
                    },
                    legend: {
                        display: true,
                        position: 'left'
                    }
                }
            },
            lineData: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [
                    {
                        label: 'Pass',
                        backgroundColor: '#42b983',
                        borderColor: '#42b983',
                        data: [40, 39, 10, 40, 39, 80, 40],
                        fill: false
                    },
                    {
                        label: 'Fail',
                        backgroundColor: '#ff6384',
                        borderColor: '#ff6384',
                        data: [20, 30, 50, 20, 60, 30, 70],
                        fill: false
                    }
                ]
            },
            lineOptions: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Defects for last 4 Weeks'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    }
                },
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Month'
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Value'
                        }
                    }
                }
            },
            barData: {
                labels: ['Client A', 'Client B', 'Client C', 'Client D'],
                datasets: [
                    {
                        label: 'Defects',
                        backgroundColor: '#42b983',
                        borderColor: '#42b983',
                        data: [30, 20, 50, 40],
                        fill: false
                    }
                ]
            },
            barOptions: {
                indexAxis: 'y', // This makes the bar chart horizontal
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Defects by Client'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    }
                },
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Defects'
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Components'
                        }
                    }
                }
            },
            componetDefectData: {
                labels: ['Defect A', 'Defect B', 'Defect C', 'Defect D'],
                datasets: [
                    {
                        label: 'Defects',
                        backgroundColor: '#42b983',
                        borderColor: '#42b983',
                        data: [30, 20, 50, 40],
                        fill: false
                    }
                ]
            },
            componetDefectOptions: {
                indexAxis: 'x', // This makes the bar chart horizontal
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Component wise defects'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    }
                },
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Defects'
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Components'
                        }
                    }
                }
            },

            runTimeData: {
                labels: ['Client A', 'Client B', 'Client C', 'Client D'],
                datasets: [
                    {
                        label: 'Run Time',
                        backgroundColor: '#42b983',
                        borderColor: '#42b983',
                        data: [30, 20, 50, 40],
                        fill: false
                    }
                ]
            },
            runTimeOptions: {
                indexAxis: 'y', // This makes the bar chart horizontal
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Run Time by Client'
                    },
                    legend: {
                        display: true,
                        position: 'bottom'
                    }
                },
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Defects'
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Machine'
                        }
                    }
                }
            },
        }
    },
    methods: {
        onSearch(value) {
            console.log('Search:', value);
            // Implement search functionality here
        },
        onFilterChange(value) {
            console.log('Filter:', value);
            // Implement filter functionality here
        }
    }
}
</script>

<style scoped>
.input-contract-container {
    padding-left: 40px;
    padding-top: 30px;
    padding-right: 40px;
}

.template-heading {
    color: #4C4C4C;
    font-size: 20px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    display: flex;
    justify-content: space-around;
    align-items: center;
}

.template-type {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    margin-top: 20px;
    border: 1px solid rgb(97, 91, 91);
    padding: 10px;
    border-radius: 10px;
}

.template-type-color {
    background-color: rgba(36, 35, 35, 0.08);
}

.template-box {
    height: 120px;
    width: 220px;
    margin-right: 20px;
    border-radius: 4px;
    box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.chart-box {
    height: 400px;
    /* Increased height */
    width: 600px;
    /* Increased width */
}

.total-components {
    border: 2px solid #A56EFF;
    color: #A56EFF;
    background-color: #a66eff3e;
}

.pass {
    border: 2px solid #3E8CFF;
    color: #3E8CFF;
    background-color: #3e8bff46;
}

.fail {
    border: 2px solid #FB4382;
    color: #FB4382;
    background-color: #fb438334;
}

.frequent-defect {
    border: 2px solid #FC8D33;
    color: #FC8D33;
    background-color: #fc8d3339;
}

.time {
    border: 2px solid #fcd033;
    color: #fcd033;
    background-color: #fcd0332f;
}

.template-title {
    font-family: "DIN Pro";
    font-size: 20px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    padding: 10px;
    position: relative;
    bottom: 0px;
}

.template-value {
    font-family: "DIN Pro";
    font-size: 20px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    padding: 10px;
    position: relative;
    bottom: 0px;
    color: black;
}

.horizontal-line {
    width: 100%;
    height: 0px;
    margin-left: 4vw;
    margin-right: 4vw;
    border: 1px solid rgba(112, 0, 255, 0.5);
    margin: 10px;
}

.template-chart {
    font-family: "DIN Pro";
    font-size: 20px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    padding: 10px;
    position: relative;
    bottom: 0px;
    color: black;
    height: 100%;
    /* Ensure the chart takes the full height of the container */
    width: 100%;
    /* Ensure the chart takes the full width of the container */
}

.header {
    background: #001529;
    color: white;
    display: flex;
    align-items: center;
    padding: 0 20px;
}

.char-container {
    margin: 30px;
}

.filter-box {
    display: flex;
    align-items: center;
}
</style>